import 'package:app_of_ice_and_fire/ui/books/detail/model/detail_book_character.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class DetailBook extends Equatable {
  final int id;
  final String name;
  final String isbn;
  final List<String> authors;
  final int numberOfPages;
  final String publisher;
  final String country;
  final String mediaType;
  final String released;
  final List<DetailBookCharacter> povCharacters;

  @override
  List<Object> get props =>
      [
        id,
        name,
        isbn,
        authors,
        numberOfPages,
        publisher,
        country,
        mediaType,
        released,
        povCharacters,
      ];

//<editor-fold desc="Data Methods">

  const DetailBook({
    required this.id,
    required this.name,
    required this.isbn,
    required this.authors,
    required this.numberOfPages,
    required this.publisher,
    required this.country,
    required this.mediaType,
    required this.released,
    required this.povCharacters,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetailBook &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          isbn == other.isbn &&
          authors == other.authors &&
          numberOfPages == other.numberOfPages &&
          publisher == other.publisher &&
          country == other.country &&
          mediaType == other.mediaType &&
          released == other.released &&
          povCharacters == other.povCharacters);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      isbn.hashCode ^
      authors.hashCode ^
      numberOfPages.hashCode ^
      publisher.hashCode ^
      country.hashCode ^
      mediaType.hashCode ^
      released.hashCode ^
      povCharacters.hashCode;

  @override
  String toString() {
    return 'DetailBook{' +
        ' id: $id,' +
        ' name: $name,' +
        ' isbn: $isbn,' +
        ' authors: $authors,' +
        ' numberOfPages: $numberOfPages,' +
        ' publisher: $publisher,' +
        ' country: $country,' +
        ' mediaType: $mediaType,' +
        ' released: $released,' +
        ' povCharacters: $povCharacters,' +
        '}';
  }

  DetailBook copyWith({
    int? id,
    String? name,
    String? isbn,
    List<String>? authors,
    int? numberOfPages,
    String? publisher,
    String? country,
    String? mediaType,
    String? released,
    List<DetailBookCharacter>? povCharacters,
  }) {
    return DetailBook(
      id: id ?? this.id,
      name: name ?? this.name,
      isbn: isbn ?? this.isbn,
      authors: authors ?? this.authors,
      numberOfPages: numberOfPages ?? this.numberOfPages,
      publisher: publisher ?? this.publisher,
      country: country ?? this.country,
      mediaType: mediaType ?? this.mediaType,
      released: released ?? this.released,
      povCharacters: povCharacters ?? this.povCharacters,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'isbn': this.isbn,
      'authors': this.authors,
      'numberOfPages': this.numberOfPages,
      'publisher': this.publisher,
      'country': this.country,
      'mediaType': this.mediaType,
      'released': this.released,
      'povCharacters': this.povCharacters,
    };
  }

  factory DetailBook.fromMap(Map<String, dynamic> map) {
    return DetailBook(
      id: map['id'] as int,
      name: map['name'] as String,
      isbn: map['isbn'] as String,
      authors: map['authors'] as List<String>,
      numberOfPages: map['numberOfPages'] as int,
      publisher: map['publisher'] as String,
      country: map['country'] as String,
      mediaType: map['mediaType'] as String,
      released: map['released'] as String,
      povCharacters: map['povCharacters'] as List<DetailBookCharacter>,
    );
  }

//</editor-fold>
}