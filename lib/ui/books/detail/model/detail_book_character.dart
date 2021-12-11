import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class DetailBookCharacter extends Equatable {
  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];

//<editor-fold desc="Data Methods">

  const DetailBookCharacter({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetailBookCharacter &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name);

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'DetailBookCharacter{' + ' id: $id,' + ' name: $name,' + '}';
  }

  DetailBookCharacter copyWith({
    int? id,
    String? name,
  }) {
    return DetailBookCharacter(
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

  factory DetailBookCharacter.fromMap(Map<String, dynamic> map) {
    return DetailBookCharacter(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

//</editor-fold>
}
