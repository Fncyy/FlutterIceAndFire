import 'package:app_of_ice_and_fire/data/network/dio_iceandfire_service.dart';
import 'package:app_of_ice_and_fire/data/network/iceandfire_api.dart';
import 'package:app_of_ice_and_fire/data/network/model/network_book.dart';
import 'package:app_of_ice_and_fire/domain/model/book.dart';

class IceAndFireNetworkDataSource {
  final IceAndFireApi _iceAndFireApi;

  IceAndFireNetworkDataSource(this._iceAndFireApi);

  Future<List<Book>?> getBooks() async {
    final networkResponse = await _iceAndFireApi.getBooks();
    if (networkResponse.response.statusCode != 200) return null;
    final networkBooks = networkResponse.data;
    return networkBooks.map((book) => book.toDomainModel()).toList();
  }
}

extension on String {
  int toBookId() =>
      int.parse(replaceFirst(IceAndFireService.BASE_URL + "/books/", ""));

  int toCharacterId() =>
      int.parse(replaceFirst(IceAndFireService.BASE_URL + "/characters/", ""));

  int toHouseId() =>
      int.parse(replaceFirst(IceAndFireService.BASE_URL + "/houses/", ""));
}

extension on NetworkBook {
  Book toDomainModel() {
    return Book(
      id: url.toBookId(),
      name: name,
      isbn: isbn,
      authors: authors,
      numberOfPages: numberOfPages,
      publisher: publisher,
      country: country,
      mediaType: mediaType,
      released: released.split('T').first,
      povCharacters: povCharacters.map((e) => e.toCharacterId()).toList(),
    );
  }
}