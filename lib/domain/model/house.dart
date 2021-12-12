import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class House extends Equatable {
  final int id;
  final String name;
  final String region;
  final String coatOfArms;
  final String words;
  final List<String> titles;
  final List<String> seats;
  final int? currentLordId;
  final int? heirId;
  final int? overlordId;
  final String founded;
  final int? founder;
  final String diedOut;
  final List<String> ancestralWeapons;
  final List<int> cadetBranchIds;

  @override
  List<Object?> get props => [
        id,
        name,
        region,
        coatOfArms,
        words,
        titles,
        seats,
        currentLordId,
        heirId,
        overlordId,
        founded,
        founder,
        diedOut,
        ancestralWeapons,
        cadetBranchIds,
      ];

//<editor-fold desc="Data Methods">

  const House({
    required this.id,
    required this.name,
    required this.region,
    required this.coatOfArms,
    required this.words,
    required this.titles,
    required this.seats,
    this.currentLordId,
    this.heirId,
    this.overlordId,
    required this.founded,
    this.founder,
    required this.diedOut,
    required this.ancestralWeapons,
    required this.cadetBranchIds,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is House &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          region == other.region &&
          coatOfArms == other.coatOfArms &&
          words == other.words &&
          titles == other.titles &&
          seats == other.seats &&
          currentLordId == other.currentLordId &&
          heirId == other.heirId &&
          overlordId == other.overlordId &&
          founded == other.founded &&
          founder == other.founder &&
          diedOut == other.diedOut &&
          ancestralWeapons == other.ancestralWeapons &&
          cadetBranchIds == other.cadetBranchIds);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      region.hashCode ^
      coatOfArms.hashCode ^
      words.hashCode ^
      titles.hashCode ^
      seats.hashCode ^
      currentLordId.hashCode ^
      heirId.hashCode ^
      overlordId.hashCode ^
      founded.hashCode ^
      founder.hashCode ^
      diedOut.hashCode ^
      ancestralWeapons.hashCode ^
      cadetBranchIds.hashCode;

  @override
  String toString() {
    return 'House{' +
        ' id: $id,' +
        ' name: $name,' +
        ' region: $region,' +
        ' coatOfArms: $coatOfArms,' +
        ' words: $words,' +
        ' titles: $titles,' +
        ' seats: $seats,' +
        ' currentLordId: $currentLordId,' +
        ' heirId: $heirId,' +
        ' overlordId: $overlordId,' +
        ' founded: $founded,' +
        ' founder: $founder,' +
        ' diedOut: $diedOut,' +
        ' ancestralWeapons: $ancestralWeapons,' +
        ' cadetBranchIds: $cadetBranchIds,' +
        '}';
  }

  House copyWith({
    int? id,
    String? name,
    String? region,
    String? coatOfArms,
    String? words,
    List<String>? titles,
    List<String>? seats,
    int? currentLordId,
    int? heirId,
    int? overlordId,
    String? founded,
    int? founder,
    String? diedOut,
    List<String>? ancestralWeapons,
    List<int>? cadetBranchIds,
  }) {
    return House(
      id: id ?? this.id,
      name: name ?? this.name,
      region: region ?? this.region,
      coatOfArms: coatOfArms ?? this.coatOfArms,
      words: words ?? this.words,
      titles: titles ?? this.titles,
      seats: seats ?? this.seats,
      currentLordId: currentLordId ?? this.currentLordId,
      heirId: heirId ?? this.heirId,
      overlordId: overlordId ?? this.overlordId,
      founded: founded ?? this.founded,
      founder: founder ?? this.founder,
      diedOut: diedOut ?? this.diedOut,
      ancestralWeapons: ancestralWeapons ?? this.ancestralWeapons,
      cadetBranchIds: cadetBranchIds ?? this.cadetBranchIds,
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
      'currentLordId': this.currentLordId,
      'heirId': this.heirId,
      'overlordId': this.overlordId,
      'founded': this.founded,
      'founder': this.founder,
      'diedOut': this.diedOut,
      'ancestralWeapons': this.ancestralWeapons,
      'cadetBranchIds': this.cadetBranchIds,
    };
  }

  factory House.fromMap(Map<String, dynamic> map) {
    return House(
      id: map['id'] as int,
      name: map['name'] as String,
      region: map['region'] as String,
      coatOfArms: map['coatOfArms'] as String,
      words: map['words'] as String,
      titles: map['titles'] as List<String>,
      seats: map['seats'] as List<String>,
      currentLordId: map['currentLordId'] as int,
      heirId: map['heirId'] as int,
      overlordId: map['overlordId'] as int,
      founded: map['founded'] as String,
      founder: map['founder'] as int,
      diedOut: map['diedOut'] as String,
      ancestralWeapons: map['ancestralWeapons'] as List<String>,
      cadetBranchIds: map['cadetBranchIds'] as List<int>,
    );
  }

//</editor-fold>
}
