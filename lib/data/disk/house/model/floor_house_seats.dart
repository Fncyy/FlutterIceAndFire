import 'package:floor/floor.dart';

@Entity(tableName: "houseSeats")
class FloorHouseSeat {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String seat;
  int houseId;

  FloorHouseSeat(this.seat, this.houseId);
}