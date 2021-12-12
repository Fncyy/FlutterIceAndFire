import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class DetailHouseHouse extends Equatable {
  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];

//<editor-fold desc="Data Methods">

  const DetailHouseHouse({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetailHouseHouse &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name);

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'DetailHouseHouse{' + ' id: $id,' + ' name: $name,' + '}';
  }

  DetailHouseHouse copyWith({
    int? id,
    String? name,
  }) {
    return DetailHouseHouse(
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

  factory DetailHouseHouse.fromMap(Map<String, dynamic> map) {
    return DetailHouseHouse(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

//</editor-fold>
}