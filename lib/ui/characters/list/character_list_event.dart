part of 'character_list_bloc.dart';

@immutable
abstract class CharacterListEvent {
  const CharacterListEvent();
}

class CharacterListLoadCharactersEvent extends CharacterListEvent {
  static final CharacterListLoadCharactersEvent _instance = CharacterListLoadCharactersEvent._();

  factory CharacterListLoadCharactersEvent() => _instance;

  CharacterListLoadCharactersEvent._();
}
