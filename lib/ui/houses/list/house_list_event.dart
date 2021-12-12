part of 'house_list_bloc.dart';

@immutable
abstract class HouseListEvent {
  const HouseListEvent();
}

class HouseListLoadHousesEvent extends HouseListEvent {
  static final HouseListLoadHousesEvent _instance =
      HouseListLoadHousesEvent._();

  factory HouseListLoadHousesEvent() => _instance;

  HouseListLoadHousesEvent._();
}
