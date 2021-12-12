import 'package:app_of_ice_and_fire/data/network/iceandfire_api.dart';
import 'package:app_of_ice_and_fire/data/network/model/network_book.dart';
import 'package:app_of_ice_and_fire/data/network/model/network_character.dart';
import 'package:app_of_ice_and_fire/data/network/model/network_house.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'dio_iceandfire_service.g.dart';

@RestApi(baseUrl: "https://www.anapioficeandfire.com/api")
abstract class IceAndFireService implements IceAndFireApi {
  static const BASE_URL = "https://www.anapioficeandfire.com/api";

  factory IceAndFireService() {
    final _dio = Dio();

    _dio.interceptors.add(InterceptorsWrapper(onRequest: (request, handler) {
      request.queryParameters["pageSize"] = 30;
      handler.next(request);
    }));

    return _IceAndFireService(_dio);
  }

  @override
  @GET("/books")
  Future<HttpResponse<List<NetworkBook>>> getBooks(
    @Query("name") String? name,
  );

  @override
  @GET("/books/{id}")
  Future<HttpResponse<NetworkBook>> getBookWithId(
    @Path("id") int id,
  );

  @override
  @GET("/characters")
  Future<HttpResponse<List<NetworkCharacter>>> getCharacters(
    @Query("page") int page,
    @Query("name") String? name,
  );

  @override
  @GET("/characters/{id}")
  Future<HttpResponse<NetworkCharacter>> getCharacterWithId(
    @Path("id") int id,
  );

  @override
  @GET("/houses")
  Future<HttpResponse<List<NetworkHouse>>> getHouses(
    @Query("page") int page,
    @Query("name") String? name,
  );

  @override
  @GET("/houses/{id}")
  Future<HttpResponse<NetworkHouse>> getHouseWithId(
    @Path("id") int id,
  );
}
