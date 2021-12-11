import 'package:floor/floor.dart';

import 'book_dao.dart';
import 'model/floor_book.dart';
import 'model/floor_book_author.dart';
import 'model/floor_book_povcharacter.dart';

@dao
abstract class FloorBookDao implements BookDao {
  @Query("SELECT * FROM books WHERE id = :id")
  Future<FloorBook?> getBook(int id);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertBooks(List<FloorBook> books);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertBook(FloorBook book);

  @Query("SELECT * FROM bookAuthors WHERE name = :name AND bookId = :bookId")
  Future<FloorBookAuthor?> getBookAuthorId(String name, int bookId);

  @Query("SELECT * FROM bookAuthors WHERE bookId = :bookId")
  Future<List<FloorBookAuthor>> getBookAuthors(int bookId);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertBookAuthor(FloorBookAuthor bookAuthors);

  @Query("SELECT * FROM bookPovCharacters WHERE characterId = :characterId AND bookId = :bookId")
  Future<FloorBookPovCharacter?> getBookPovCharacterId(int characterId, int bookId);

  @Query("SELECT * FROM bookPovCharacters WHERE bookId = :bookId")
  Future<List<FloorBookPovCharacter>> getBookPovCharacters(int bookId);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertBookPovCharacter(FloorBookPovCharacter bookPovCharacters);
}
