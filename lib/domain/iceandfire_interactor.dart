import 'package:app_of_ice_and_fire/data/disk/iceandfire_disk_data_source.dart';
import 'package:app_of_ice_and_fire/data/network/iceandfire_network_data_source.dart';
import 'package:app_of_ice_and_fire/domain/model/character.dart';

import 'model/book.dart';

class IceAndFireInteractor {
  final IceAndFireDiskDataSource _diskDataSource;
  final IceAndFireNetworkDataSource _networkDataSource;

  IceAndFireInteractor(
    this._diskDataSource,
    this._networkDataSource,
  );

  Future<List<Book>> getBooks() async {
    final books = await _networkDataSource.getBooks();
    if (books != null) {
      _diskDataSource.saveBooks(books);
      return books;
    } else {
      return [];
    }
  }

  Future<Book?> getBookWithId(int id) async {
    var book = await _diskDataSource.getBookWithId(id);
    if (book != null) return book;

    book = await _networkDataSource.getBookWithId(id);
    if (book != null) _diskDataSource.saveBook(book);
    return book;
  }

  Future<List<Character>> getCharacters() async {
    final characters = await _networkDataSource.getCharacters();
    if (characters != null) {
      _diskDataSource.saveCharacters(characters);
      return characters;
    } else {
      return [];
    }
  }

  Future<Character?> getCharacterWithId(int id) async {
    var character = await _diskDataSource.getCharacterWithId(id);
    if (character != null) return character;

    character = await _networkDataSource.getCharacterWithId(id);
    if (character != null) _diskDataSource.saveCharacter(character);
    return character;
  }
}
