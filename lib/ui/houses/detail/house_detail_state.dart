part of 'house_detail_bloc.dart';

@immutable
abstract class HouseDetailState {
  const HouseDetailState();
}

class HouseDetailLoadingState extends HouseDetailState {
  static final HouseDetailLoadingState _instance = HouseDetailLoadingState._();

  factory HouseDetailLoadingState() => _instance;

  HouseDetailLoadingState._();
}

class HouseDetailErrorState extends HouseDetailState {
  static final HouseDetailErrorState _instance = HouseDetailErrorState._();

  factory HouseDetailErrorState() => _instance;

  HouseDetailErrorState._();
}

class HouseDetailContentReadyState extends HouseDetailState with EquatableMixin {
  final DetailHouse house;

  HouseDetailContentReadyState({required this.house});

  @override
  List<Object> get props => [house];
}
