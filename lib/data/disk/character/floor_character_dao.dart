import 'package:app_of_ice_and_fire/data/disk/character/character_dao.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_aliases.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_allegiances.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_books.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_playedby.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_povbooks.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_titles.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_tvseries.dart';
import 'package:floor/floor.dart';

@dao
abstract class FloorCharacterDao implements CharacterDao {
  @override
  @Query("SELECT * FROM characters WHERE id = :id")
  Future<FloorCharacter?> getCharacter(int id);

  @override
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertCharacters(List<FloorCharacter> books);

  @override
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertCharacter(FloorCharacter book);
  
  @override
  @Query("SELECT * FROM characterAliases WHERE alias = :alias AND characterId = :characterId")
  Future<FloorCharacterAlias?> getCharacterAliasId(String alias, int characterId);

  @override
  @Query("SELECT * FROM characterAliases WHERE characterId = :characterId")
  Future<List<FloorCharacterAlias>> getCharacterAliasesForCharacter(int characterId);

  @override
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertCharacterAlias(FloorCharacterAlias characterAlias);

  @override
  @Query("SELECT * FROM characterAllegiances WHERE houseId = :houseId AND characterId = :characterId")
  Future<FloorCharacterAllegiance?> getCharacterAllegianceId(int houseId, int characterId);

  @override
  @Query("SELECT * FROM characterAllegiances WHERE characterId = :characterId")
  Future<List<FloorCharacterAllegiance>> getCharacterAllegiancesForCharacter(int characterId);

  @override
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertCharacterAllegiance(FloorCharacterAllegiance characterAllegiance);

  @override
  @Query("SELECT * FROM characterBooks WHERE bookId = :bookId AND characterId = :characterId")
  Future<FloorCharacterBook?> getCharacterBookId(int bookId, int characterId);

  @override
  @Query("SELECT * FROM characterBooks WHERE characterId = :characterId")
  Future<List<FloorCharacterBook>> getCharacterBooksForCharacter(int characterId);

  @override
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertCharacterBook(FloorCharacterBook characterBook);

  @override
  @Query("SELECT * FROM characterPlayedBy WHERE name = :name AND characterId = :characterId")
  Future<FloorCharacterPlayedBy?> getCharacterPlayedById(String name, int characterId);

  @override
  @Query("SELECT * FROM characterPlayedBy WHERE characterId = :characterId")
  Future<List<FloorCharacterPlayedBy>> getCharacterPlayedByForCharacter(int characterId);

  @override
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertCharacterPlayedBy(FloorCharacterPlayedBy characterPlayedBy);

  @override
  @Query("SELECT * FROM characterPovBooks WHERE bookId = :bookId AND characterId = :characterId")
  Future<FloorCharacterPovBook?> getCharacterPovBookId(int bookId, int characterId);

  @override
  @Query("SELECT * FROM characterPovBooks WHERE characterId = :characterId")
  Future<List<FloorCharacterPovBook>> getCharacterPovBooksForCharacter(int characterId);

  @override
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertCharacterPovBook(FloorCharacterPovBook characterPovBook);

  @override
  @Query("SELECT * FROM characterTitles WHERE title = :title AND characterId = :characterId")
  Future<FloorCharacterTitle?> getCharacterTitleId(String title, int characterId);

  @override
  @Query("SELECT * FROM characterTitles WHERE characterId = :characterId")
  Future<List<FloorCharacterTitle>> getCharacterTitlesForCharacter(int characterId);

  @override
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertCharacterTitle(FloorCharacterTitle characterTitle);

  @override
  @Query("SELECT * FROM characterTvSeries WHERE title = :title AND characterId = :characterId")
  Future<FloorCharacterTvSeries?> getCharacterTvSeriesId(String title, int characterId);

  @override
  @Query("SELECT * FROM characterTitles WHERE characterId = :characterId")
  Future<List<FloorCharacterTvSeries>> getCharacterTvSeriesForCharacter(int characterId);

  @override
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertCharacterTvSeries(FloorCharacterTvSeries characterTvSeries);
}