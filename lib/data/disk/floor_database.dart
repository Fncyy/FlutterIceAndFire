import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'book/floor_book_dao.dart';
import 'book/model/floor_book.dart';
import 'book/model/floor_book_author.dart';
import 'book/model/floor_book_povcharacter.dart';

part 'floor_database.g.dart';

@Database(
  version: 1,
  entities: [
    FloorBook,
    FloorBookAuthor,
    FloorBookPovCharacter,
  ],
)
abstract class FloorIceAndFireDatabase extends FloorDatabase {
  FloorBookDao get bookDao;
}
