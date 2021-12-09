import 'model/floor_book.dart';
import 'model/floor_book_author.dart';
import 'model/floor_book_povcharacter.dart';

abstract class BookDao {
  Future<FloorBook?> getBook(int id);

  Future<void> insertBooks(List<FloorBook> books);

  Future<void> insertBook(FloorBook book);

  Future<List<FloorBookAuthor>> getBookAuthors(int bookId);

  Future<void> insertBookAuthors(List<FloorBookAuthor> bookAuthors);

  Future<List<FloorBookPovCharacter>> getBookPovCharacters(int bookId);

  Future<void> insertBookPovCharacters(List<FloorBookPovCharacter> bookPovCharacters);
}
