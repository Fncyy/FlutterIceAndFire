import 'package:floor/floor.dart';

@Entity(tableName: "characterTitles")
class FloorCharacterTitle {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String title;
  int characterId;

  FloorCharacterTitle(this.title, this.characterId);
}
