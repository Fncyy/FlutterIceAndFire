import 'package:floor/floor.dart';

@Entity(tableName: "characterPovBooks")
class FloorCharacterPovBook {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int bookId;
  int characterId;

  FloorCharacterPovBook(this.bookId, this.characterId);
}
