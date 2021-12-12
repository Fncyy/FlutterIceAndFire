part of 'character_detail_bloc.dart';

@immutable
abstract class CharacterDetailState {
  const CharacterDetailState();
}

class CharacterDetailLoadingState extends CharacterDetailState {
  static final CharacterDetailLoadingState _instance = CharacterDetailLoadingState._();

  factory CharacterDetailLoadingState() => _instance;

  CharacterDetailLoadingState._();
}

class CharacterDetailErrorState extends CharacterDetailState {
  static final CharacterDetailErrorState _instance = CharacterDetailErrorState._();

  factory CharacterDetailErrorState() => _instance;

  CharacterDetailErrorState._();
}

class CharacterDetailContentReadyState extends CharacterDetailState with EquatableMixin {
  final DetailCharacter character;

  CharacterDetailContentReadyState({required this.character});

  @override
  List<Object> get props => [character];
}