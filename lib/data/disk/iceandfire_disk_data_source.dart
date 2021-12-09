import 'package:app_of_ice_and_fire/data/disk/book/book_dao.dart';
import 'package:app_of_ice_and_fire/data/disk/book/model/floor_book.dart';
import 'package:app_of_ice_and_fire/data/disk/book/model/floor_book_author.dart';
import 'package:app_of_ice_and_fire/data/disk/book/model/floor_book_povcharacter.dart';
import 'package:app_of_ice_and_fire/domain/model/book.dart';
import 'package:flutter/cupertino.dart';

class IceAndFireDiskDataSource {
  final BookDao _bookDao;

  IceAndFireDiskDataSource(this._bookDao);

  Future<Book?> getBook(int id) async {
    try {
      final book = await _bookDao.getBook(id);
      final authors = await _bookDao.getBookAuthors(id);
      final characters = await _bookDao.getBookPovCharacters(id);
      return book?.toDomainBook(authors, characters);
    } catch (error) {
      return null;
    }
  }

  Future<void> saveBook(Book book) async {
    _bookDao.insertBook(book.toFloorBook());
    _bookDao.insertBookAuthors(book.toFloorBookAuthors());
    _bookDao.insertBookPovCharacters(book.toFloorBookPovCharacters());
  }

  Future<void> saveBooks(List<Book> books) async {
    _bookDao.insertBooks(books.map((e) => e.toFloorBook()).toList());
    _bookDao.insertBookAuthors(books
        .map((book) => book.toFloorBookAuthors())
        .expand((element) => element)
        .toList());
    _bookDao.insertBookPovCharacters(books
        .map((book) => book.toFloorBookPovCharacters())
        .expand((element) => element)
        .toList());
  }
}

extension on Book {
  FloorBook toFloorBook() {
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

  List<FloorBookAuthor> toFloorBookAuthors() {
    return authors.map((name) => FloorBookAuthor(name, id)).toList();
  }

  List<FloorBookPovCharacter> toFloorBookPovCharacters() {
    return povCharacters
        .map((characterId) => FloorBookPovCharacter(characterId, id))
        .toList();
  }
}

extension on FloorBook {
  Book toDomainBook(List<FloorBookAuthor> authors,
      List<FloorBookPovCharacter> povCharacters) {
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
      povCharacters: povCharacters.map((e) => e.id).toList(),
    );
  }
}
