import 'dart:async';

import 'package:app_of_ice_and_fire/data/disk/book/floor_book_dao.dart';
import 'package:app_of_ice_and_fire/data/disk/book/model/floor_book.dart';
import 'package:app_of_ice_and_fire/data/disk/book/model/floor_book_author.dart';
import 'package:app_of_ice_and_fire/data/disk/book/model/floor_book_povcharacter.dart';
import 'package:app_of_ice_and_fire/data/disk/character/floor_character_dao.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_aliases.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_allegiances.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_books.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_playedby.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_povbooks.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_titles.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_tvseries.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'floor_database.g.dart';

@Database(
  version: 1,
  entities: [
    FloorBook,
    FloorBookAuthor,
    FloorBookPovCharacter,
    FloorCharacter,
    FloorCharacterAlias,
    FloorCharacterAllegiance,
    FloorCharacterBook,
    FloorCharacterPlayedBy,
    FloorCharacterPovBook,
    FloorCharacterTitle,
    FloorCharacterTvSeries,
  ],
)
abstract class FloorIceAndFireDatabase extends FloorDatabase {
  FloorBookDao get bookDao;
  FloorCharacterDao get characterDao;
}
