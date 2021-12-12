import 'package:floor/floor.dart';

@Entity(tableName: "houseCadetBranches")
class FloorHouseCadetBranch {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int cadetBranchId;
  int houseId;

  FloorHouseCadetBranch(this.cadetBranchId, this.houseId);
}