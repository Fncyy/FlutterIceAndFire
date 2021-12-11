import 'package:app_of_ice_and_fire/data/disk/character/character_dao.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_aliases.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_allegiances.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_books.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_playedby.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_povbooks.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_titles.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_tvseries.dart';
import 'package:app_of_ice_and_fire/domain/model/book.dart';
import 'package:app_of_ice_and_fire/domain/model/character.dart';

import 'book/book_dao.dart';
import 'book/model/floor_book.dart';
import 'book/model/floor_book_author.dart';
import 'book/model/floor_book_povcharacter.dart';

class IceAndFireDiskDataSource {
  final BookDao _bookDao;
  final CharacterDao _characterDao;

  IceAndFireDiskDataSource(this._bookDao, this._characterDao);

  Future<Book?> getBookWithId(int id) async {
    try {
      final book = await _bookDao.getBook(id);
      return book?.toDomainModel(
        authors: await _bookDao.getBookAuthors(id),
        povCharacters: await _bookDao.getBookPovCharacters(id),
      );
    } catch (error) {
      return null;
    }
  }

  Future<void> saveBook(Book book) async {
    _bookDao.insertBook(book.toFloorModel());
    book.toFloorBookAuthors().forEach((author) async {
      await _bookDao.getBookAuthorId(author.name, author.bookId) ??
          _bookDao.insertBookAuthor(author);
    });
    book.toFloorBookPovCharacters().forEach((character) async {
      await _bookDao.getBookPovCharacterId(
              character.characterId, character.bookId) ??
          _bookDao.insertBookPovCharacter(character);
    });
  }

  Future<void> saveBooks(List<Book> books) async {
    for (var book in books) {
      saveBook(book);
    }
  }

  Future<Character?> getCharacterWithId(int id) async {
    try {
      final character = await _characterDao.getCharacter(id);
      return character?.toDomainModel(
        titles: await _characterDao.getCharacterTitlesForCharacter(id),
        aliases: await _characterDao.getCharacterAliasesForCharacter(id),
        allegianceIds:
            await _characterDao.getCharacterAllegiancesForCharacter(id),
        bookIds: await _characterDao.getCharacterBooksForCharacter(id),
        povBookIds: await _characterDao.getCharacterPovBooksForCharacter(id),
        tvSeries: await _characterDao.getCharacterTvSeriesForCharacter(id),
        playedBy: await _characterDao.getCharacterPlayedByForCharacter(id),
      );
    } catch (error) {
      return null;
    }
  }

  Future<void> saveCharacter(Character character) async {
    _characterDao.insertCharacter(character.toFloorModel());
    character.toFloorCharacterAliases().forEach((element) async {
      await _characterDao.getCharacterAliasId(
              element.alias, element.characterId) ??
          _characterDao.insertCharacterAlias(element);
    });
    character.toFloorCharacterAllegiances()?.forEach((element) async {
      await _characterDao.getCharacterAllegianceId(
              element.houseId, element.characterId) ??
          _characterDao.insertCharacterAllegiance(element);
    });
    character.toFloorCharacterBooks().forEach((element) async {
      await _characterDao.getCharacterBookId(
              element.bookId, element.characterId) ??
          _characterDao.insertCharacterBook(element);
    });
    character.toFloorCharacterPlayedBy().forEach((element) async {
      await _characterDao.getCharacterPlayedById(
              element.name, element.characterId) ??
          _characterDao.insertCharacterPlayedBy(element);
    });
    character.toFloorCharacterPovBooks().forEach((element) async {
      await _characterDao.getCharacterPovBookId(
              element.bookId, element.characterId) ??
          _characterDao.insertCharacterPovBook(element);
    });
    character.toFloorCharacterTitles().forEach((element) async {
      await _characterDao.getCharacterTitleId(
              element.title, element.characterId) ??
          _characterDao.insertCharacterTitle(element);
    });
    character.toFloorCharacterTvSeries().forEach((element) async {
      await _characterDao.getCharacterTvSeriesId(
              element.title, element.characterId) ??
          _characterDao.insertCharacterTvSeries(element);
    });
  }

  Future<void> saveCharacters(List<Character> characters) async {
    for (var character in characters) {
      saveCharacter(character);
    }
  }
}

extension on Book {
  FloorBook toFloorModel() {
    return FloorBook(
      id,
      name,
      isbn,
      numberOfPages,
      publisher,
      country,
      mediaType,
      released,
    );
  }

  List<FloorBookAuthor> toFloorBookAuthors() =>
      authors.map((name) => FloorBookAuthor(name, id)).toList();

  List<FloorBookPovCharacter> toFloorBookPovCharacters() => povCharacters
      .map((characterId) => FloorBookPovCharacter(characterId, id))
      .toList();
}

extension on FloorBook {
  Book toDomainModel({
    required List<FloorBookAuthor> authors,
    required List<FloorBookPovCharacter> povCharacters,
  }) {
    return Book(
      id: id,
      name: name,
      isbn: isbn,
      authors: authors.map((e) => e.name).toList(),
      numberOfPages: numberOfPages,
      publisher: publisher,
      country: country,
      mediaType: mediaType,
      released: released,
      povCharacters: povCharacters.map((e) => e.characterId).toList(),
    );
  }
}

extension on Character {
  FloorCharacter toFloorModel() {
    return FloorCharacter(
      id,
      name,
      gender,
      culture,
      born,
      died,
      fatherId,
      motherId,
      spouseId,
    );
  }

  List<FloorCharacterAlias> toFloorCharacterAliases() =>
      aliases.map((e) => FloorCharacterAlias(e, id)).toList();

  List<FloorCharacterAllegiance>? toFloorCharacterAllegiances() =>
      allegianceIds?.map((e) => FloorCharacterAllegiance(e, id)).toList();

  List<FloorCharacterBook> toFloorCharacterBooks() =>
      bookIds.map((e) => FloorCharacterBook(e, id)).toList();

  List<FloorCharacterPlayedBy> toFloorCharacterPlayedBy() =>
      playedBy.map((e) => FloorCharacterPlayedBy(e, id)).toList();

  List<FloorCharacterPovBook> toFloorCharacterPovBooks() =>
      povBookIds.map((e) => FloorCharacterPovBook(e, id)).toList();

  List<FloorCharacterTitle> toFloorCharacterTitles() =>
      titles.map((e) => FloorCharacterTitle(e, id)).toList();

  List<FloorCharacterTvSeries> toFloorCharacterTvSeries() =>
      tvSeries.map((e) => FloorCharacterTvSeries(e, id)).toList();
}

extension on FloorCharacter {
  Character toDomainModel({
    required List<FloorCharacterTitle> titles,
    required List<FloorCharacterAlias> aliases,
    required List<FloorCharacterAllegiance> allegianceIds,
    required List<FloorCharacterBook> bookIds,
    required List<FloorCharacterPovBook> povBookIds,
    required List<FloorCharacterTvSeries> tvSeries,
    required List<FloorCharacterPlayedBy> playedBy,
  }) {
    return Character(
      id: id,
      name: name,
      gender: gender,
      culture: culture,
      born: born,
      died: died,
      titles: titles.map((e) => e.title).toList(),
      aliases: aliases.map((e) => e.alias).toList(),
      fatherId: fatherId,
      motherId: motherId,
      spouseId: spouseId,
      allegianceIds: allegianceIds.map((e) => e.houseId).toList(),
      bookIds: bookIds.map((e) => e.bookId).toList(),
      povBookIds: povBookIds.map((e) => e.bookId).toList(),
      tvSeries: tvSeries.map((e) => e.title).toList(),
      playedBy: playedBy.map((e) => e.name).toList(),
    );
  }
}
