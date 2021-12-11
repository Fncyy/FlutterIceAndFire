import 'package:floor/floor.dart';

@Entity(tableName: "characterAliases")
class FloorCharacterAlias {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String alias;
  int characterId;

  FloorCharacterAlias(this.alias, this.characterId);
}
