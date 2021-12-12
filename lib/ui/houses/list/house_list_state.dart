part of 'house_list_bloc.dart';

@immutable
abstract class HouseListState {
  const HouseListState();
}

class HouseListLoadingState extends HouseListState {
  static final HouseListLoadingState _instance = HouseListLoadingState._();

  factory HouseListLoadingState() => _instance;

  HouseListLoadingState._();
}

abstract class HouseListContentState extends HouseListState {
  final List<House> houses;

  HouseListContentState({required this.houses});
}

class HouseListContentReadyState extends HouseListContentState with EquatableMixin {
  HouseListContentReadyState({required List<House> houses}) : super(houses: houses);

  @override
  List<Object> get props => [houses];
}

class HouseListErrorState extends HouseListContentState with EquatableMixin {
  HouseListErrorState({required List<House> houses}) : super(houses: houses);

  @override
  List<Object> get props => [houses];
}