import 'package:app_of_ice_and_fire/data/network/dio_iceandfire_service.dart';
import 'package:app_of_ice_and_fire/data/network/iceandfire_api.dart';
import 'package:app_of_ice_and_fire/data/network/model/network_book.dart';
import 'package:app_of_ice_and_fire/data/network/model/network_character.dart';
import 'package:app_of_ice_and_fire/domain/model/book.dart';
import 'package:app_of_ice_and_fire/domain/model/character.dart';

class IceAndFireNetworkDataSource {
  final IceAndFireApi _api;

  IceAndFireNetworkDataSource(this._api);

  Future<List<Book>?> getBooks() async {
    final networkResponse = await _api.getBooks();
    if (networkResponse.response.statusCode != 200) return null;
    final networkBooks = networkResponse.data;
    return networkBooks.map((book) => book.toDomainModel()).toList();
  }

  Future<Book?> getBookWithId(int id) async {
    final networkResponse = await _api.getBookWithId(id);
    if (networkResponse.response.statusCode != 200) return null;
    final networkBook = networkResponse.data;
    return networkBook.toDomainModel();
  }

  Future<List<Character>?> getCharacters() async {
    final networkResponse = await _api.getCharacters();
    if (networkResponse.response.statusCode != 200) return null;
    final networkCharacters = networkResponse.data;
    return networkCharacters
        .map((character) => character.toDomainModel())
        .toList();
  }

  Future<Character?> getCharacterWithId(int id) async {
    final networkResponse = await _api.getCharacterWithId(id);
    if (networkResponse.response.statusCode != 200) return null;
    final networkCharacter = networkResponse.data;
    return networkCharacter.toDomainModel();
  }
}

extension on String {
  int toBookId() =>
      int.parse(replaceFirst(IceAndFireService.BASE_URL + "/books/", ""));

  int toCharacterId() =>
      int.parse(replaceFirst(IceAndFireService.BASE_URL + "/characters/", ""));

  int toHouseId() =>
      int.parse(replaceFirst(IceAndFireService.BASE_URL + "/houses/", ""));
}

extension on NetworkBook {
  Book toDomainModel() {
    return Book(
      id: url.toBookId(),
      name: name,
      isbn: isbn,
      authors: authors,
      numberOfPages: numberOfPages,
      publisher: publisher,
      country: country,
      mediaType: mediaType,
      released: released.split('T').first,
      povCharacters: povCharacters.map((e) => e.toCharacterId()).toList(),
    );
  }
}

extension on NetworkCharacter {
  Character toDomainModel() {
    return Character(
      id: url.toCharacterId(),
      name: name,
      gender: gender,
      culture: culture,
      born: born,
      died: died,
      titles: titles,
      aliases: aliases,
      fatherId: father.isNotEmpty ? father.toCharacterId() : null,
      motherId: mother.isNotEmpty ? mother.toCharacterId() : null,
      spouseId: spouse.isNotEmpty ? spouse.toCharacterId() : null,
      allegianceIds: allegiances.map((e) => e.toHouseId()).toList(),
      bookIds: books.map((e) => e.toBookId()).toList(),
      povBookIds: povBooks.map((e) => e.toBookId()).toList(),
      tvSeries: tvSeries,
      playedBy: playedBy,
    );
  }
}
