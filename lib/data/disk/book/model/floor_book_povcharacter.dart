import 'package:floor/floor.dart';

@Entity(tableName: "bookPovCharacters")
class FloorBookPovCharacter {
  @primaryKey
  int id;
  int bookId;

  FloorBookPovCharacter(
    this.id,
    this.bookId,
  );
}
