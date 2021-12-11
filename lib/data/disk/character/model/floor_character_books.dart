import 'package:floor/floor.dart';

@Entity(tableName: "characterBooks")
class FloorCharacterBook {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int bookId;
  int characterId;

  FloorCharacterBook(this.bookId, this.characterId);
}
