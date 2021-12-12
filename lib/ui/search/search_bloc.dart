import 'dart:async';

import 'package:app_of_ice_and_fire/domain/iceandfire_interactor.dart';
import 'package:app_of_ice_and_fire/ui/search/search_type.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IceAndFireInteractor _interactor;

  SearchBloc(
    this._interactor,
  ) : super(SearchInitialState()) {
    on<SearchSendFetchEvent>((event, emit) async {
      if (event.query.isEmpty) {
        return emit(SearchInitialState());
      }

      var results = [];
      switch (event.type) {
        case SearchType.book:
          results = await _interactor.getBooks(event.query);
          break;
        case SearchType.character:
          results = await _interactor.getCharacters(1, event.query);
          break;
        case SearchType.house:
          results = await _interactor.getHouses(1, event.query);
          break;
      }
      emit(SearchContentReadyState(results: results));
    });
  }
}
