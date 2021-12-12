part of 'character_list_bloc.dart';

@immutable
abstract class CharacterListState {
  const CharacterListState();
}

class CharacterListLoadingState extends CharacterListState {
  static final CharacterListLoadingState _instance = CharacterListLoadingState._();

  factory CharacterListLoadingState() => _instance;

  CharacterListLoadingState._();
}

abstract class CharacterListContentState extends CharacterListState {
  final List<Character> characters;

  CharacterListContentState({required this.characters});
}

class CharacterListContentReadyState extends CharacterListContentState with EquatableMixin {
  CharacterListContentReadyState({required List<Character> characters}) : super(characters: characters);

  @override
  List<Object> get props => [characters];
}

class CharacterListErrorState extends CharacterListContentState with EquatableMixin {
  CharacterListErrorState({required List<Character> characters}) : super(characters: characters);

  @override
  List<Object> get props => [characters];
}