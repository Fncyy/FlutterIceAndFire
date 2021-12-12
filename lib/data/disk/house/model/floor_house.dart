import 'package:floor/floor.dart';

@Entity(tableName: "houses")
class FloorHouse {
  @primaryKey
  int id;
  String name;
  String region;
  String coatOfArms;
  String words;
  int? currentLordId;
  int? heirId;
  int? overlordId;
  String founded;
  int? founder;
  String diedOut;

  FloorHouse(
    this.id,
    this.name,
    this.region,
    this.coatOfArms,
    this.words,
    this.currentLordId,
    this.heirId,
    this.overlordId,
    this.founded,
    this.founder,
    this.diedOut,
  );
}
