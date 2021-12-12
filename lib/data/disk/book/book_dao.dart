import 'model/floor_book.dart';
import 'model/floor_book_author.dart';
import 'model/floor_book_povcharacter.dart';

abstract class BookDao {
  Future<FloorBook?> getBook(
    int id,
  );

  Future<void> insertBooks(
    List<FloorBook> books,
  );

  Future<void> insertBook(
    FloorBook book,
  );


  Future<FloorBookAuthor?> getBookAuthorId(
    String name,
    int bookId,
  );

  Future<List<FloorBookAuthor>> getBookAuthors(
    int bookId,
  );

  Future<void> insertBookAuthor(
    FloorBookAuthor bookAuthors,
  );


  Future<FloorBookPovCharacter?> getBookPovCharacterId(
    int characterId,
    int bookId,
  );

  Future<List<FloorBookPovCharacter>> getBookPovCharacters(
    int bookId,
  );

  Future<void> insertBookPovCharacter(
    FloorBookPovCharacter bookPovCharacters,
  );
}
