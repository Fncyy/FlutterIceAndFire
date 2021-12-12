import 'package:equatable/equatable.dart';

class DetailCharacterCharacter extends Equatable {
  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];

//<editor-fold desc="Data Methods">

  const DetailCharacterCharacter({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetailCharacterCharacter &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name);

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'DetailCharacterCharacter{' + ' id: $id,' + ' name: $name,' + '}';
  }

  DetailCharacterCharacter copyWith({
    int? id,
    String? name,
  }) {
    return DetailCharacterCharacter(
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

  factory DetailCharacterCharacter.fromMap(Map<String, dynamic> map) {
    return DetailCharacterCharacter(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

//</editor-fold>
}