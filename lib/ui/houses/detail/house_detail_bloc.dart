import 'package:app_of_ice_and_fire/domain/iceandfire_interactor.dart';
import 'package:app_of_ice_and_fire/domain/model/character.dart';
import 'package:app_of_ice_and_fire/domain/model/house.dart';
import 'package:app_of_ice_and_fire/ui/houses/detail/model/detail_house.dart';
import 'package:app_of_ice_and_fire/ui/houses/detail/model/detail_house_character.dart';
import 'package:app_of_ice_and_fire/ui/houses/detail/model/detail_house_house.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'house_detail_event.dart';

part 'house_detail_state.dart';

class HouseDetailBloc extends Bloc<HouseDetailEvent, HouseDetailState> {
  final IceAndFireInteractor _interactor;

  HouseDetailBloc(
    this._interactor,
  ) : super(HouseDetailLoadingState()) {
    on<HouseDetailLoadHouseEvent>((event, emit) async {
      final house = await _interactor.getHouseWithId(event.id);
      if (house != null) {
        DetailHouseCharacter? currentLord;
        if (house.currentLordId != null) {
          var value =
              await _interactor.getCharacterWithId(house.currentLordId!);
          currentLord = value!.toHouseDetailModel();
        }

        DetailHouseCharacter? heir;
        if (house.heirId != null) {
          var value = await _interactor.getCharacterWithId(house.heirId!);
          heir = value!.toHouseDetailModel();
        }

        DetailHouseHouse? overlord;
        if (house.overlordId != null) {
          var value = await _interactor.getHouseWithId(house.overlordId!);
          overlord = value!.toHouseDetailModel();
        }

        DetailHouseCharacter? founder;
        if (house.founder != null) {
          var value = await _interactor.getCharacterWithId(house.founder!);
          founder = value!.toHouseDetailModel();
        }

        var cadetBranches = <DetailHouseHouse>[];
        for (var id in house.cadetBranchIds) {
          final house = await _interactor.getHouseWithId(id);
          cadetBranches.add(house!.toHouseDetailModel());
        }

        emit(
          HouseDetailContentReadyState(
            house: house.toHouseDetailMainModel(
              currentLord,
              heir,
              overlord,
              founder,
              cadetBranches,
            ),
          ),
        );
      } else {
        emit(HouseDetailErrorState());
      }
    });
  }
}

extension on Character {
  DetailHouseCharacter toHouseDetailModel() =>
      DetailHouseCharacter(id: id, name: name);
}

extension on House {
  DetailHouse toHouseDetailMainModel(
    DetailHouseCharacter? currentLord,
    DetailHouseCharacter? heir,
    DetailHouseHouse? overlord,
    DetailHouseCharacter? founder,
    List<DetailHouseHouse> cadetBranches,
  ) =>
      DetailHouse(
        id: id,
        name: name,
        region: region,
        coatOfArms: coatOfArms,
        words: words,
        titles: titles,
        seats: seats,
        currentLord: currentLord,
        heir: heir,
        overlord: overlord,
        founded: founded,
        founder: founder,
        diedOut: diedOut,
        ancestralWeapons: ancestralWeapons,
        cadetBranches: cadetBranches,
      );

  DetailHouseHouse toHouseDetailModel() => DetailHouseHouse(id: id, name: name);
}
