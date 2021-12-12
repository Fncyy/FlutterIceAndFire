import 'package:app_of_ice_and_fire/data/disk/house/house_dao.dart';
import 'package:app_of_ice_and_fire/data/disk/house/model/floor_house.dart';
import 'package:app_of_ice_and_fire/data/disk/house/model/floor_house_ancestralweapons.dart';
import 'package:app_of_ice_and_fire/data/disk/house/model/floor_house_cadetbranches.dart';
import 'package:app_of_ice_and_fire/data/disk/house/model/floor_house_seats.dart';
import 'package:app_of_ice_and_fire/data/disk/house/model/floor_house_titles.dart';
import 'package:floor/floor.dart';

@dao
abstract class FloorHouseDao implements HouseDao {
  @override
  @Query("SELECT * FROM houses WHERE id = :id")
  Future<FloorHouse?> getHouse(int id);

  @override
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertHouses(List<FloorHouse> houses);

  @override
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertHouse(FloorHouse house);

  @override
  @Query("SELECT * FROM houseAncestralWeapons WHERE weapon = :weapon AND houseId = :houseId")
  Future<FloorHouseAncestralWeapon?> getHouseAncestralWeaponId(String weapon, int houseId);

  @override
  @Query("SELECT * FROM houseAncestralWeapons WHERE houseId = :houseId")
  Future<List<FloorHouseAncestralWeapon>> getHouseAncestralWeaponsForHouse(int houseId);

  @override
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertHouseAncestralWeapon(FloorHouseAncestralWeapon ancestralWeapon);

  @override
  @Query("SELECT * FROM houseCadetBranches WHERE cadetBranchId = :cadetBranchId AND houseId = :houseId")
  Future<FloorHouseCadetBranch?> getHouseCadetBranchId(int cadetBranchId, int houseId);

  @override
  @Query("SELECT * FROM houseCadetBranches WHERE houseId = :houseId")
  Future<List<FloorHouseCadetBranch>> getHouseCadetBranchForHouse(int houseId);

  @override
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertHouseCadetBranch(FloorHouseCadetBranch cadetBranch);

  @override
  @Query("SELECT * FROM houseSeats WHERE seat = :seat AND houseId = :houseId")
  Future<FloorHouseSeat?> getHouseSeatId(String seat, int houseId);

  @override
  @Query("SELECT * FROM houseSeats WHERE houseId = :houseId")
  Future<List<FloorHouseSeat>> getHouseSeatForHouse(int houseId);

  @override
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertHouseSeat(FloorHouseSeat seat);

  @override
  @Query("SELECT * FROM houseTitles WHERE title = :title AND houseId = :houseId")
  Future<FloorHouseTitle?> getHouseTitleId(String title, int houseId);

  @override
  @Query("SELECT * FROM houseTitles WHERE houseId = :houseId")
  Future<List<FloorHouseTitle>> getHouseTitleForHouse(int houseId);

  @override
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertHouseTitle(FloorHouseTitle seat);
}