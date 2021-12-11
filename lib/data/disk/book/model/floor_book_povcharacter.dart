import 'package:floor/floor.dart';

@Entity(tableName: "bookPovCharacters")
class FloorBookPovCharacter {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int characterId;
  int bookId;

  FloorBookPovCharacter(
    this.characterId,
    this.bookId,
  );
}
