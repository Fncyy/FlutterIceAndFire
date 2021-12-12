import 'package:app_of_ice_and_fire/data/disk/house/model/floor_house.dart';
import 'package:app_of_ice_and_fire/data/disk/house/model/floor_house_ancestralweapons.dart';
import 'package:app_of_ice_and_fire/data/disk/house/model/floor_house_cadetbranches.dart';
import 'package:app_of_ice_and_fire/data/disk/house/model/floor_house_seats.dart';
import 'package:app_of_ice_and_fire/data/disk/house/model/floor_house_titles.dart';

abstract class HouseDao {
  Future<FloorHouse?> getHouse(
    int id,
  );

  Future<void> insertHouses(
    List<FloorHouse> houses,
  );

  Future<void> insertHouse(
    FloorHouse house,
  );


  Future<FloorHouseAncestralWeapon?> getHouseAncestralWeaponId(
    String weapon,
    int houseId,
  );

  Future<List<FloorHouseAncestralWeapon>> getHouseAncestralWeaponsForHouse(
    int houseId,
  );

  Future<void> insertHouseAncestralWeapon(
    FloorHouseAncestralWeapon ancestralWeapon,
  );


  Future<FloorHouseCadetBranch?> getHouseCadetBranchId(
    int cadetBranchId,
    int houseId,
  );

  Future<List<FloorHouseCadetBranch>> getHouseCadetBranchForHouse(
    int houseId,
  );

  Future<void> insertHouseCadetBranch(
      FloorHouseCadetBranch cadetBranch,
  );


  Future<FloorHouseSeat?> getHouseSeatId(
    String seat,
    int houseId,
  );

  Future<List<FloorHouseSeat>> getHouseSeatForHouse(
    int houseId,
  );

  Future<void> insertHouseSeat(
    FloorHouseSeat seat,
  );


  Future<FloorHouseTitle?> getHouseTitleId(
    String title,
    int houseId,
  );

  Future<List<FloorHouseTitle>> getHouseTitleForHouse(
    int houseId,
  );

  Future<void> insertHouseTitle(
    FloorHouseTitle seat,
  );
}
