import 'package:app_of_ice_and_fire/data/network/iceandfire_api.dart';
import 'package:app_of_ice_and_fire/data/network/model/network_book.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'dio_iceandfire_service.g.dart';

@RestApi(baseUrl: "https://www.anapioficeandfire.com/api")
abstract class IceAndFireService implements IceAndFireApi {

  static const BASE_URL = "https://www.anapioficeandfire.com/api";

  factory IceAndFireService() {
    final _dio = Dio();

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          request.queryParameters["pageSize"] = 30;
          handler.next(request);
        }
      )
    );

    return _IceAndFireService(_dio);
  }

  @override
  @GET("/books")
  Future<HttpResponse<List<NetworkBook>>> getBooks();
}