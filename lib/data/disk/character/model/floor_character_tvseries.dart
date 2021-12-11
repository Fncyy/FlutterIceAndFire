import 'package:floor/floor.dart';

@Entity(tableName: "characterTvSeries")
class FloorCharacterTvSeries {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String title;
  int characterId;

  FloorCharacterTvSeries(this.title, this.characterId);
}
