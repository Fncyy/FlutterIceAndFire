import 'package:app_of_ice_and_fire/data/network/iceandfire_api.dart';
import 'package:app_of_ice_and_fire/data/network/model/network_book.dart';
import 'package:app_of_ice_and_fire/data/network/model/network_character.dart';
import 'package:app_of_ice_and_fire/data/network/model/network_house.dart';
import 'package:app_of_ice_and_fire/domain/model/book.dart';
import 'package:app_of_ice_and_fire/domain/model/character.dart';
import 'package:app_of_ice_and_fire/domain/model/house.dart';

class IceAndFireNetworkDataSource {
  final IceAndFireApi _api;

  IceAndFireNetworkDataSource(this._api);

  Future<List<Book>?> getBooks([String? query]) async {
    final networkResponse = await _api.getBooks(query);
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

  Future<List<Character>?> getCharacters(int page, [String? query]) async {
    final networkResponse = await _api.getCharacters(page, query);
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

  Future<List<House>?> getHouses(int page, [String? query]) async {
    final networkResponse = await _api.getHouses(page, query);
    if (networkResponse.response.statusCode != 200) return null;
    final networkHouses = networkResponse.data;
    return networkHouses.map((house) => house.toDomainModel()).toList();
  }

  Future<House?> getHouseWithId(int id) async {
    final networkResponse = await _api.getHouseWithId(id);
    if (networkResponse.response.statusCode != 200) return null;
    final networkHouse = networkResponse.data;
    return networkHouse.toDomainModel();
  }
}

extension on String {
  int toId() {
    return int.parse(split('/').last);
  }
}

extension on NetworkBook {
  Book toDomainModel() => Book(
        id: url.toId(),
        name: name,
        isbn: isbn,
        authors: authors,
        numberOfPages: numberOfPages,
        publisher: publisher,
        country: country,
        mediaType: mediaType,
        released: released.split('T').first,
        povCharacters: povCharacters.map((e) => e.toId()).toList(),
      );
}

extension on NetworkCharacter {
  Character toDomainModel() => Character(
        id: url.toId(),
        name: name,
        gender: gender,
        culture: culture,
        born: born,
        died: died,
        titles: titles,
        aliases: aliases,
        fatherId: father.isNotEmpty ? father.toId() : null,
        motherId: mother.isNotEmpty ? mother.toId() : null,
        spouseId: spouse.isNotEmpty ? spouse.toId() : null,
        allegianceIds: allegiances.map((e) => e.toId()).toList(),
        bookIds: books.map((e) => e.toId()).toList(),
        povBookIds: povBooks.map((e) => e.toId()).toList(),
        tvSeries: tvSeries,
        playedBy: playedBy,
      );
}

extension on NetworkHouse {
  House toDomainModel() => House(
        id: url.toId(),
        name: name,
        region: region,
        coatOfArms: coatOfArms,
        words: words,
        titles: titles,
        seats: seats,
        currentLordId: currentLord.isNotEmpty ? currentLord.toId() : null,
        heirId: heir.isNotEmpty ? heir.toId() : null,
        overlordId: overlord.isNotEmpty ? overlord.toId() : null,
        founded: founded,
        founder: founder.isNotEmpty ? founder.toId() : null,
        diedOut: diedOut,
        ancestralWeapons: ancestralWeapons,
        cadetBranchIds: cadetBranches.map((e) => e.toId()).toList(),
      );
}
