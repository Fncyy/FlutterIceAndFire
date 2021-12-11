import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class Character extends Equatable {
  final int id;
  final String name;
  final String gender;
  final String culture;
  final String born;
  final String died;
  final List<String> titles;
  final List<String> aliases;
  final int? fatherId;
  final int? motherId;
  final int? spouseId;
  final List<int>? allegianceIds;
  final List<int> bookIds;
  final List<int> povBookIds;
  final List<String> tvSeries;
  final List<String> playedBy;

  @override
  List<Object> get props => [
        id,
        name,
        gender,
        culture,
        born,
        died,
        titles,
        aliases,
        bookIds,
        povBookIds,
        tvSeries,
        playedBy,
      ];

//<editor-fold desc="Data Methods">

  const Character({
    required this.id,
    required this.name,
    required this.gender,
    required this.culture,
    required this.born,
    required this.died,
    required this.titles,
    required this.aliases,
    required this.fatherId,
    required this.motherId,
    required this.spouseId,
    required this.allegianceIds,
    required this.bookIds,
    required this.povBookIds,
    required this.tvSeries,
    required this.playedBy,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Character &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          gender == other.gender &&
          culture == other.culture &&
          born == other.born &&
          died == other.died &&
          titles == other.titles &&
          aliases == other.aliases &&
          fatherId == other.fatherId &&
          motherId == other.motherId &&
          spouseId == other.spouseId &&
          allegianceIds == other.allegianceIds &&
          bookIds == other.bookIds &&
          povBookIds == other.povBookIds &&
          tvSeries == other.tvSeries &&
          playedBy == other.playedBy);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      gender.hashCode ^
      culture.hashCode ^
      born.hashCode ^
      died.hashCode ^
      titles.hashCode ^
      aliases.hashCode ^
      fatherId.hashCode ^
      motherId.hashCode ^
      spouseId.hashCode ^
      allegianceIds.hashCode ^
      bookIds.hashCode ^
      povBookIds.hashCode ^
      tvSeries.hashCode ^
      playedBy.hashCode;

  @override
  String toString() {
    return 'Character{' +
        ' id: $id,' +
        ' name: $name,' +
        ' gender: $gender,' +
        ' culture: $culture,' +
        ' born: $born,' +
        ' died: $died,' +
        ' titles: $titles,' +
        ' aliases: $aliases,' +
        ' fatherId: $fatherId,' +
        ' motherId: $motherId,' +
        ' spouseId: $spouseId,' +
        ' allegianceIds: $allegianceIds,' +
        ' bookIds: $bookIds,' +
        ' povBookIds: $povBookIds,' +
        ' tvSeries: $tvSeries,' +
        ' playedBy: $playedBy,' +
        '}';
  }

  Character copyWith({
    int? id,
    String? name,
    String? gender,
    String? culture,
    String? born,
    String? died,
    List<String>? titles,
    List<String>? aliases,
    int? fatherId,
    int? motherId,
    int? spouseId,
    List<int>? allegianceIds,
    List<int>? bookIds,
    List<int>? povBookIds,
    List<String>? tvSeries,
    List<String>? playedBy,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      culture: culture ?? this.culture,
      born: born ?? this.born,
      died: died ?? this.died,
      titles: titles ?? this.titles,
      aliases: aliases ?? this.aliases,
      fatherId: fatherId ?? this.fatherId,
      motherId: motherId ?? this.motherId,
      spouseId: spouseId ?? this.spouseId,
      allegianceIds: allegianceIds ?? this.allegianceIds,
      bookIds: bookIds ?? this.bookIds,
      povBookIds: povBookIds ?? this.povBookIds,
      tvSeries: tvSeries ?? this.tvSeries,
      playedBy: playedBy ?? this.playedBy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'gender': this.gender,
      'culture': this.culture,
      'born': this.born,
      'died': this.died,
      'titles': this.titles,
      'aliases': this.aliases,
      'fatherId': this.fatherId,
      'motherId': this.motherId,
      'spouseId': this.spouseId,
      'allegianceIds': this.allegianceIds,
      'bookIds': this.bookIds,
      'povBookIds': this.povBookIds,
      'tvSeries': this.tvSeries,
      'playedBy': this.playedBy,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'] as int,
      name: map['name'] as String,
      gender: map['gender'] as String,
      culture: map['culture'] as String,
      born: map['born'] as String,
      died: map['died'] as String,
      titles: map['titles'] as List<String>,
      aliases: map['aliases'] as List<String>,
      fatherId: map['fatherId'] as int,
      motherId: map['motherId'] as int,
      spouseId: map['spouseId'] as int,
      allegianceIds: map['allegianceIds'] as List<int>,
      bookIds: map['bookIds'] as List<int>,
      povBookIds: map['povBookIds'] as List<int>,
      tvSeries: map['tvSeries'] as List<String>,
      playedBy: map['playedBy'] as List<String>,
    );
  }

//</editor-fold>
}
