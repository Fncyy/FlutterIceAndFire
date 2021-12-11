import 'package:app_of_ice_and_fire/data/network/model/network_book.dart';
import 'package:app_of_ice_and_fire/data/network/model/network_character.dart';
import 'package:retrofit/dio.dart';

abstract class IceAndFireApi {
  Future<HttpResponse<List<NetworkBook>>> getBooks();

  Future<HttpResponse<NetworkBook>> getBookWithId(int id);

  Future<HttpResponse<List<NetworkCharacter>>> getCharacters();

  Future<HttpResponse<NetworkCharacter>> getCharacterWithId(int id);
}
