import 'package:app_of_ice_and_fire/data/disk/iceandfire_disk_data_source.dart';
import 'package:app_of_ice_and_fire/data/network/iceandfire_network_data_source.dart';
import 'package:flutter/cupertino.dart';

import 'model/book.dart';

class IceAndFireInteractor {
  final IceAndFireDiskDataSource _diskDataSource;
  final IceAndFireNetworkDataSource _networkDataSource;

  IceAndFireInteractor(
    this._diskDataSource,
    this._networkDataSource,
  );

  Future<List<Book>> getBooks() async {
    final books = await _networkDataSource.getBooks();
    if (books != null) {
      _diskDataSource.saveBooks(books);
      return books;
    } else {
      return [];
    }
  }
}
