import 'package:equatable/equatable.dart';

class DetailCharacterHouse extends Equatable {
  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];

//<editor-fold desc="Data Methods">

  const DetailCharacterHouse({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is DetailCharacterHouse &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name);

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'DetailCharacterHouse{' + ' id: $id,' + ' name: $name,' + '}';
  }

  DetailCharacterHouse copyWith({
    int? id,
    String? name,
  }) {
    return DetailCharacterHouse(
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

  factory DetailCharacterHouse.fromMap(Map<String, dynamic> map) {
    return DetailCharacterHouse(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

//</editor-fold>
}