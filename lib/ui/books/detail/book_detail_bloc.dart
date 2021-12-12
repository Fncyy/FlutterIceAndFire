import 'package:app_of_ice_and_fire/domain/iceandfire_interactor.dart';
import 'package:app_of_ice_and_fire/domain/model/book.dart';
import 'package:app_of_ice_and_fire/domain/model/character.dart';
import 'package:app_of_ice_and_fire/ui/books/detail/model/detail_book.dart';
import 'package:app_of_ice_and_fire/ui/books/detail/model/detail_book_character.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'book_detail_event.dart';

part 'book_detail_state.dart';

class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState> {
  final IceAndFireInteractor _interactor;

  BookDetailBloc(
    this._interactor,
  ) : super(BookDetailLoadingState()) {
    on<BookDetailLoadBookEvent>((event, emit) async {
      final book = await _interactor.getBookWithId(event.id);
      if (book != null) {
        var povCharacters = <DetailBookCharacter>[];
        for (var id in book.povCharacters) {
          final character = await _interactor.getCharacterWithId(id);
          povCharacters.add(character!.toBookDetailModel());
        }
        emit(BookDetailContentReadyState(
            book: book.toBookDetailModel(povCharacters)));
      } else {
        emit(BookDetailErrorState());
      }
    });
  }
}

extension on Book {
  DetailBook toBookDetailModel(List<DetailBookCharacter> povCharacters) {
    return DetailBook(
      id: id,
      name: name,
      isbn: isbn,
      authors: authors,
      numberOfPages: numberOfPages,
      publisher: publisher,
      country: country,
      mediaType: mediaType,
      released: released,
      povCharacters: povCharacters,
    );
  }
}

extension on Character {
  DetailBookCharacter toBookDetailModel() {
    return DetailBookCharacter(
      id: id,
      name: name,
    );
  }
}
