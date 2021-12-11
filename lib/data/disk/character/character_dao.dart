import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_aliases.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_allegiances.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_books.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_playedby.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_povbooks.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_titles.dart';
import 'package:app_of_ice_and_fire/data/disk/character/model/floor_character_tvseries.dart';

abstract class CharacterDao {
  Future<FloorCharacter?> getCharacter(int id);
  Future<void> insertCharacters(List<FloorCharacter> books);
  Future<void> insertCharacter(FloorCharacter book);

  Future<FloorCharacterAlias?> getCharacterAliasId(String alias, int characterId);
  Future<List<FloorCharacterAlias>> getCharacterAliasesForCharacter(int characterId);
  Future<void> insertCharacterAlias(FloorCharacterAlias characterAlias);

  Future<FloorCharacterAllegiance?> getCharacterAllegianceId(int houseId, int characterId);
  Future<List<FloorCharacterAllegiance>> getCharacterAllegiancesForCharacter(int characterId);
  Future<void> insertCharacterAllegiance(FloorCharacterAllegiance characterAllegiance);

  Future<FloorCharacterBook?> getCharacterBookId(int bookId, int characterId);
  Future<List<FloorCharacterBook>> getCharacterBooksForCharacter(int characterId);
  Future<void> insertCharacterBook(FloorCharacterBook characterBook);

  Future<FloorCharacterPlayedBy?> getCharacterPlayedById(String name, int characterId);
  Future<List<FloorCharacterPlayedBy>> getCharacterPlayedByForCharacter(int characterId);
  Future<void> insertCharacterPlayedBy(FloorCharacterPlayedBy characterPlayedBy);

  Future<FloorCharacterPovBook?> getCharacterPovBookId(int bookId, int characterId);
  Future<List<FloorCharacterPovBook>> getCharacterPovBooksForCharacter(int characterId);
  Future<void> insertCharacterPovBook(FloorCharacterPovBook characterPovBook);

  Future<FloorCharacterTitle?> getCharacterTitleId(String title, int characterId);
  Future<List<FloorCharacterTitle>> getCharacterTitlesForCharacter(int characterId);
  Future<void> insertCharacterTitle(FloorCharacterTitle characterTitle);

  Future<FloorCharacterTvSeries?> getCharacterTvSeriesId(String title, int characterId);
  Future<List<FloorCharacterTvSeries>> getCharacterTvSeriesForCharacter(int characterId);
  Future<void> insertCharacterTvSeries(FloorCharacterTvSeries characterTvSeries);
}