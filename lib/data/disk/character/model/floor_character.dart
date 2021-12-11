import 'package:floor/floor.dart';

@Entity(tableName: "characters")
class FloorCharacter {
  @primaryKey
  int id;
  String name;
  String gender;
  String culture;
  String born;
  String died;
  int? fatherId;
  int? motherId;
  int? spouseId;

  FloorCharacter(
    this.id,
    this.name,
    this.gender,
    this.culture,
    this.born,
    this.died,
    this.fatherId,
    this.motherId,
    this.spouseId,
  );
}
