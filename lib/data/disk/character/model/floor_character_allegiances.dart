import 'package:floor/floor.dart';

@Entity(tableName: "characterAllegiances")
class FloorCharacterAllegiance {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int houseId;
  int characterId;

  FloorCharacterAllegiance(this.houseId, this.characterId);
}
