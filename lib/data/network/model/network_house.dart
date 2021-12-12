import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_house.g.dart';

@immutable
@JsonSerializable()
class NetworkHouse {
  final String url;
  final String name;
  final String region;
  final String coatOfArms;
  final String words;
  final List<String> titles;
  final List<String> seats;
  final String currentLord;
  final String heir;
  final String overlord;
  final String founded;
  final String founder;
  final String diedOut;
  final List<String> ancestralWeapons;
  final List<String> cadetBranches;

  NetworkHouse(
    this.url,
    this.name,
    this.region,
    this.coatOfArms,
    this.words,
    this.titles,
    this.seats,
    this.currentLord,
    this.heir,
    this.overlord,
    this.founded,
    this.founder,
    this.diedOut,
    this.ancestralWeapons,
    this.cadetBranches,
  );

  static const fromJsonFactory = _$NetworkHouseFromJson;

  factory NetworkHouse.fromJson(Map<String, dynamic> json) =>
      _$NetworkHouseFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkHouseToJson(this);
}
