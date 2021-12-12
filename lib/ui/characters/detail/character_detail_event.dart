part of 'character_detail_bloc.dart';

@immutable
abstract class CharacterDetailEvent {
  const CharacterDetailEvent();
}

class CharacterDetailLoadCharacterEvent extends CharacterDetailEvent {
  final int id;

  CharacterDetailLoadCharacterEvent(this.id);
}