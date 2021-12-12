import 'dart:async';

import 'package:app_of_ice_and_fire/domain/iceandfire_interactor.dart';
import 'package:app_of_ice_and_fire/domain/model/house.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'house_list_event.dart';

part 'house_list_state.dart';

class HouseListBloc extends Bloc<HouseListEvent, HouseListState> {
  final IceAndFireInteractor _interactor;
  int page = 1;
  bool isFetching = false;

  HouseListBloc(
    this._interactor,
  ) : super(HouseListLoadingState()) {
    on<HouseListEvent>((event, emit) async {
      emit(HouseListLoadingState());
      final houses = await _interactor.getHouses(page);
      emit(HouseListContentReadyState(houses: houses));
      page++;
    });
  }
}
