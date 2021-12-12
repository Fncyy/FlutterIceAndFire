import 'package:floor/floor.dart';

@Entity(tableName: "houseAncestralWeapons")
class FloorHouseAncestralWeapon {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String weapon;
  int houseId;

  FloorHouseAncestralWeapon(this.weapon, this.houseId);
}
