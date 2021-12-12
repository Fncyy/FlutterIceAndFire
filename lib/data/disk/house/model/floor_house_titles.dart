import 'package:floor/floor.dart';

@Entity(tableName: "houseTitles")
class FloorHouseTitle {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String title;
  int houseId;

  FloorHouseTitle(this.title, this.houseId);
}