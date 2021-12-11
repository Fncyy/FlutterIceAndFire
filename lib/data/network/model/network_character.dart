import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_character.g.dart';

@immutable
@JsonSerializable()
class NetworkCharacter {
  final String url;
  final String name;
  final String gender;
  final String culture;
  final String born;
  final String died;
  final List<String> titles;
  final List<String> aliases;
  final String father;
  final String mother;
  final String spouse;
  final List<String> allegiances;
  final List<String> books;
  final List<String> povBooks;
  final List<String> tvSeries;
  final List<String> playedBy;

  NetworkCharacter(
    this.url,
    this.name,
    this.gender,
    this.culture,
    this.born,
    this.died,
    this.titles,
    this.aliases,
    this.father,
    this.mother,
    this.spouse,
    this.allegiances,
    this.books,
    this.povBooks,
    this.tvSeries,
    this.playedBy,
  );

  static const fromJsonFactory = _$NetworkCharacterFromJson;

  factory NetworkCharacter.fromJson(Map<String, dynamic> json) =>
      _$NetworkCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkCharacterToJson(this);
}
