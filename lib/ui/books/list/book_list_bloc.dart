import 'package:app_of_ice_and_fire/domain/iceandfire_interactor.dart';
import 'package:app_of_ice_and_fire/ui/books/list/book_list_event.dart';
import 'package:app_of_ice_and_fire/ui/books/list/book_list_state.dart';
import 'package:bloc/bloc.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState> {
  final IceAndFireInteractor _interactor;

  BookListBloc(
    this._interactor,
  ) : super(BookListLoadingState()) {
    on<BookListLoadBooksEvent>(
      (event, emit) async {
        final books = await _interactor.getBooks();
        emit(BookListContentReadyState(books: books));
      },
    );
  }
}
