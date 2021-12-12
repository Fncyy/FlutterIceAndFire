part of 'house_detail_bloc.dart';

@immutable
abstract class HouseDetailEvent {
  const HouseDetailEvent();
}

class HouseDetailLoadHouseEvent extends HouseDetailEvent {
  final int id;

  HouseDetailLoadHouseEvent(this.id);
}
