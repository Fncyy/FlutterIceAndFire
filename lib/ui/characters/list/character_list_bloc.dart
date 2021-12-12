import 'dart:async';

import 'package:app_of_ice_and_fire/domain/iceandfire_interactor.dart';
import 'package:app_of_ice_and_fire/domain/model/character.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'character_list_event.dart';

part 'character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  final IceAndFireInteractor _interactor;
  int page = 1;
  bool isFetching = false;

  CharacterListBloc(
    this._interactor,
  ) : super(CharacterListLoadingState()) {
    on<CharacterListLoadCharactersEvent>((event, emit) async {
      emit(CharacterListLoadingState());
      final characters = await _interactor.getCharacters(page);
      emit(CharacterListContentReadyState(characters: characters));
      page++;
    });
  }
}
