import 'package:equatable/equatable.dart';

class DetailCharacterBook extends Equatable {
  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];

//<editor-fold desc="Data Methods">

  const DetailCharacterBook({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetailCharacterBook &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name);

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'DetailCharacterBook{' + ' id: $id,' + ' title: $name,' + '}';
  }

  DetailCharacterBook copyWith({
    int? id,
    String? title,
  }) {
    return DetailCharacterBook(
      id: id ?? this.id,
      name: title ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.name,
    };
  }

  factory DetailCharacterBook.fromMap(Map<String, dynamic> map) {
    return DetailCharacterBook(
      id: map['id'] as int,
      name: map['title'] as String,
    );
  }

//</editor-fold>
}