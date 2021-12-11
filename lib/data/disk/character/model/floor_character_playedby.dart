import 'package:floor/floor.dart';

@Entity(tableName: "characterPlayedBy")
class FloorCharacterPlayedBy {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String name;
  int characterId;

  FloorCharacterPlayedBy(this.name, this.characterId);
}
