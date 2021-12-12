import 'package:app_of_ice_and_fire/domain/iceandfire_interactor.dart';
import 'package:app_of_ice_and_fire/domain/model/book.dart';
import 'package:app_of_ice_and_fire/domain/model/character.dart';
import 'package:app_of_ice_and_fire/domain/model/house.dart';
import 'package:app_of_ice_and_fire/ui/characters/detail/model/detail_character.dart';
import 'package:app_of_ice_and_fire/ui/characters/detail/model/detail_character_book.dart';
import 'package:app_of_ice_and_fire/ui/characters/detail/model/detail_character_character.dart';
import 'package:app_of_ice_and_fire/ui/characters/detail/model/detail_character_house.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'character_detail_event.dart';

part 'character_detail_state.dart';

class CharacterDetailBloc
    extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  final IceAndFireInteractor _interactor;

  CharacterDetailBloc(
    this._interactor,
  ) : super(CharacterDetailLoadingState()) {
    on<CharacterDetailLoadCharacterEvent>((event, emit) async {
      final character = await _interactor.getCharacterWithId(event.id);
      if (character != null) {
        DetailCharacterCharacter? father;
        if (character.fatherId != null) {
          var value = await _interactor.getCharacterWithId(character.fatherId!);
          father = value!.toCharacterDetailModel();
        }

        DetailCharacterCharacter? mother;
        if (character.motherId != null) {
          var value = await _interactor.getCharacterWithId(character.motherId!);
          mother = value!.toCharacterDetailModel();
        }

        DetailCharacterCharacter? spouse;
        if (character.spouseId != null) {
          var value = await _interactor.getCharacterWithId(character.spouseId!);
          spouse = value!.toCharacterDetailModel();
        }

        var allegiances = <DetailCharacterHouse>[];
        for (var id in character.allegianceIds) {
          final house = await _interactor.getHouseWithId(id);
          allegiances.add(house!.toCharacterDetailModel());
        }

        var books = <DetailCharacterBook>[];
        for (var id in character.bookIds) {
          final book = await _interactor.getBookWithId(id);
          books.add(book!.toCharacterDetailModel());
        }

        var povBooks = <DetailCharacterBook>[];
        for (var id in character.povBookIds) {
          final book = await _interactor.getBookWithId(id);
          povBooks.add(book!.toCharacterDetailModel());
        }

        emit(
          CharacterDetailContentReadyState(
            character: character.toCharacterDetailMainModel(
              father,
              mother,
              spouse,
              allegiances,
              books,
              povBooks,
            ),
          ),
        );
      } else {
        emit(CharacterDetailErrorState());
      }
    });
  }
}

extension on Book {
  DetailCharacterBook toCharacterDetailModel() =>
      DetailCharacterBook(id: id, name: name);
}

extension on Character {
  DetailCharacter toCharacterDetailMainModel(
    DetailCharacterCharacter? father,
    DetailCharacterCharacter? mother,
    DetailCharacterCharacter? spouse,
    List<DetailCharacterHouse> allegiances,
    List<DetailCharacterBook> books,
    List<DetailCharacterBook> povBooks,
  ) =>
      DetailCharacter(
        id: id,
        name: name,
        gender: gender,
        culture: culture,
        born: born,
        died: died,
        titles: titles,
        aliases: aliases,
        father: father,
        mother: mother,
        spouse: spouse,
        allegiances: allegiances,
        books: books,
        povBooks: povBooks,
        tvSeries: tvSeries,
        playedBy: playedBy,
      );

  DetailCharacterCharacter toCharacterDetailModel() =>
      DetailCharacterCharacter(id: id, name: name);
}

extension on House {
  DetailCharacterHouse toCharacterDetailModel() =>
      DetailCharacterHouse(id: id, name: name);
}
