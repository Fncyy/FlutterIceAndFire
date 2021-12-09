import 'package:app_of_ice_and_fire/data/network/model/network_book.dart';
import 'package:retrofit/dio.dart';

abstract class IceAndFireApi {
  Future<HttpResponse<List<NetworkBook>>> getBooks();
}