import 'package:app_of_ice_and_fire/ui/houses/detail/model/detail_house_character.dart';
import 'package:app_of_ice_and_fire/ui/houses/detail/model/detail_house_house.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class DetailHouse extends Equatable {
  final int id;
  final String name;
  final String region;
  final String coatOfArms;
  final String words;
  final List<String> titles;
  final List<String> seats;
  final DetailHouseCharacter? currentLord;
  final DetailHouseCharacter? heir;
  final DetailHouseHouse? overlord;
  final String founded;
  final DetailHouseCharacter? founder;
  final String diedOut;
  final List<String> ancestralWeapons;
  final List<DetailHouseHouse> cadetBranches;

  @override
  List<Object?> get props =>
      [
        id,
        name,
        region,
        coatOfArms,
        words,
        titles,
        seats,
        currentLord,
        heir,
        overlord,
        founded,
        founder,
        diedOut,
        ancestralWeapons,
        cadetBranches,
      ];

//<editor-fold desc="Data Methods">

  const DetailHouse({
    required this.id,
    required this.name,
    required this.region,
    required this.coatOfArms,
    required this.words,
    required this.titles,
    required this.seats,
    required this.currentLord,
    required this.heir,
    required this.overlord,
    required this.founded,
    required this.founder,
    required this.diedOut,
    required this.ancestralWeapons,
    required this.cadetBranches,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetailHouse &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          region == other.region &&
          coatOfArms == other.coatOfArms &&
          words == other.words &&
          titles == other.titles &&
          seats == other.seats &&
          currentLord == other.currentLord &&
          heir == other.heir &&
          overlord == other.overlord &&
          founded == other.founded &&
          founder == other.founder &&
          diedOut == other.diedOut &&
          ancestralWeapons == other.ancestralWeapons &&
          cadetBranches == other.cadetBranches);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      region.hashCode ^
      coatOfArms.hashCode ^
      words.hashCode ^
      titles.hashCode ^
      seats.hashCode ^
      currentLord.hashCode ^
      heir.hashCode ^
      overlord.hashCode ^
      founded.hashCode ^
      founder.hashCode ^
      diedOut.hashCode ^
      ancestralWeapons.hashCode ^
      cadetBranches.hashCode;

  @override
  String toString() {
    return 'DetailHouse{' +
        ' id: $id,' +
        ' name: $name,' +
        ' region: $region,' +
        ' coatOfArms: $coatOfArms,' +
        ' words: $words,' +
        ' titles: $titles,' +
        ' seats: $seats,' +
        ' currentLord: $currentLord,' +
        ' heir: $heir,' +
        ' overlord: $overlord,' +
        ' founded: $founded,' +
        ' founder: $founder,' +
        ' diedOut: $diedOut,' +
        ' ancestralWeapons: $ancestralWeapons,' +
        ' cadetBranches: $cadetBranches,' +
        '}';
  }

  DetailHouse copyWith({
    int? id,
    String? name,
    String? region,
    String? coatOfArms,
    String? words,
    List<String>? titles,
    List<String>? seats,
    DetailHouseCharacter? currentLord,
    DetailHouseCharacter? heir,
    DetailHouseHouse? overlord,
    String? founded,
    DetailHouseCharacter? founder,
    String? diedOut,
    List<String>? ancestralWeapons,
    List<DetailHouseHouse>? cadetBranches,
  }) {
    return DetailHouse(
      id: id ?? this.id,
      name: name ?? this.name,
      region: region ?? this.region,
      coatOfArms: coatOfArms ?? this.coatOfArms,
      words: words ?? this.words,
      titles: titles ?? this.titles,
      seats: seats ?? this.seats,
      currentLord: currentLord ?? this.currentLord,
      heir: heir ?? this.heir,
      overlord: overlord ?? this.overlord,
      founded: founded ?? this.founded,
      founder: founder ?? this.founder,
      diedOut: diedOut ?? this.diedOut,
      ancestralWeapons: ancestralWeapons ?? this.ancestralWeapons,
      cadetBranches: cadetBranches ?? this.cadetBranches,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'region': this.region,
      'coatOfArms': this.coatOfArms,
      'words': this.words,
      'titles': this.titles,
      'seats': this.seats,
      'currentLord': this.currentLord,
      'heir': this.heir,
      'overlord': this.overlord,
      'founded': this.founded,
      'founder': this.founder,
      'diedOut': this.diedOut,
      'ancestralWeapons': this.ancestralWeapons,
      'cadetBranches': this.cadetBranches,
    };
  }

  factory DetailHouse.fromMap(Map<String, dynamic> map) {
    return DetailHouse(
      id: map['id'] as int,
      name: map['name'] as String,
      region: map['region'] as String,
      coatOfArms: map['coatOfArms'] as String,
      words: map['words'] as String,
      titles: map['titles'] as List<String>,
      seats: map['seats'] as List<String>,
      currentLord: map['currentLord'] as DetailHouseCharacter,
      heir: map['heir'] as DetailHouseCharacter,
      overlord: map['overlord'] as DetailHouseHouse,
      founded: map['founded'] as String,
      founder: map['founder'] as DetailHouseCharacter,
      diedOut: map['diedOut'] as String,
      ancestralWeapons: map['ancestralWeapons'] as List<String>,
      cadetBranches: map['cadetBranches'] as List<DetailHouseHouse>,
    );
  }

//</editor-fold>
}