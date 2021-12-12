import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class DetailHouseCharacter extends Equatable {
  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];

//<editor-fold desc="Data Methods">

  const DetailHouseCharacter({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetailHouseCharacter &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name);

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'DetailHouseCharacter{' + ' id: $id,' + ' name: $name,' + '}';
  }

  DetailHouseCharacter copyWith({
    int? id,
    String? name,
  }) {
    return DetailHouseCharacter(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
    };
  }

  factory DetailHouseCharacter.fromMap(Map<String, dynamic> map) {
    return DetailHouseCharacter(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

//</editor-fold>
}
