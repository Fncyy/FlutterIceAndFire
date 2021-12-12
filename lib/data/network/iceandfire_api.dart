import 'package:app_of_ice_and_fire/data/network/model/network_book.dart';
import 'package:app_of_ice_and_fire/data/network/model/network_character.dart';
import 'package:app_of_ice_and_fire/data/network/model/network_house.dart';
import 'package:retrofit/dio.dart';

abstract class IceAndFireApi {
  Future<HttpResponse<List<NetworkBook>>> getBooks(String? name);

  Future<HttpResponse<NetworkBook>> getBookWithId(int id);

  Future<HttpResponse<List<NetworkCharacter>>> getCharacters(int page, String? name);

  Future<HttpResponse<NetworkCharacter>> getCharacterWithId(int id);

  Future<HttpResponse<List<NetworkHouse>>> getHouses(int page, String? name);

  Future<HttpResponse<NetworkHouse>> getHouseWithId(int id);
}
