import 'package:app_of_ice_and_fire/ui/characters/detail/model/detail_character_book.dart';
import 'package:app_of_ice_and_fire/ui/characters/detail/model/detail_character_character.dart';
import 'package:app_of_ice_and_fire/ui/characters/detail/model/detail_character_house.dart';
import 'package:equatable/equatable.dart';

class DetailCharacter extends Equatable {
  final int id;
  final String name;
  final String gender;
  final String culture;
  final String born;
  final String died;
  final List<String> titles;
  final List<String> aliases;
  final DetailCharacterCharacter? father;
  final DetailCharacterCharacter? mother;
  final DetailCharacterCharacter? spouse;
  final List<DetailCharacterHouse> allegiances;
  final List<DetailCharacterBook> books;
  final List<DetailCharacterBook> povBooks;
  final List<String> tvSeries;
  final List<String> playedBy;

  @override
  List<Object?> get props => [
        id,
        name,
        gender,
        culture,
        born,
        died,
        titles,
        aliases,
        father,
        mother,
        spouse,
        allegiances,
        books,
        povBooks,
        tvSeries,
        playedBy,
      ];

//<editor-fold desc="Data Methods">

  const DetailCharacter({
    required this.id,
    required this.name,
    required this.gender,
    required this.culture,
    required this.born,
    required this.died,
    required this.titles,
    required this.aliases,
    required this.father,
    required this.mother,
    required this.spouse,
    required this.allegiances,
    required this.books,
    required this.povBooks,
    required this.tvSeries,
    required this.playedBy,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetailCharacter &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          gender == other.gender &&
          culture == other.culture &&
          born == other.born &&
          died == other.died &&
          titles == other.titles &&
          aliases == other.aliases &&
          father == other.father &&
          mother == other.mother &&
          spouse == other.spouse &&
          allegiances == other.allegiances &&
          books == other.books &&
          povBooks == other.povBooks &&
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
      father.hashCode ^
      mother.hashCode ^
      spouse.hashCode ^
      allegiances.hashCode ^
      books.hashCode ^
      povBooks.hashCode ^
      tvSeries.hashCode ^
      playedBy.hashCode;

  @override
  String toString() {
    return 'DetailCharacter{' +
        ' id: $id,' +
        ' name: $name,' +
        ' gender: $gender,' +
        ' culture: $culture,' +
        ' born: $born,' +
        ' died: $died,' +
        ' titles: $titles,' +
        ' aliases: $aliases,' +
        ' father: $father,' +
        ' mother: $mother,' +
        ' spouse: $spouse,' +
        ' allegiances: $allegiances,' +
        ' books: $books,' +
        ' povBooks: $povBooks,' +
        ' tvSeries: $tvSeries,' +
        ' playedBy: $playedBy,' +
        '}';
  }

  DetailCharacter copyWith({
    int? id,
    String? name,
    String? gender,
    String? culture,
    String? born,
    String? died,
    List<String>? titles,
    List<String>? aliases,
    DetailCharacterCharacter? father,
    DetailCharacterCharacter? mother,
    DetailCharacterCharacter? spouse,
    List<DetailCharacterHouse>? allegiances,
    List<DetailCharacterBook>? books,
    List<DetailCharacterBook>? povBooks,
    List<String>? tvSeries,
    List<String>? playedBy,
  }) {
    return DetailCharacter(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      culture: culture ?? this.culture,
      born: born ?? this.born,
      died: died ?? this.died,
      titles: titles ?? this.titles,
      aliases: aliases ?? this.aliases,
      father: father ?? this.father,
      mother: mother ?? this.mother,
      spouse: spouse ?? this.spouse,
      allegiances: allegiances ?? this.allegiances,
      books: books ?? this.books,
      povBooks: povBooks ?? this.povBooks,
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
      'father': this.father,
      'mother': this.mother,
      'spouse': this.spouse,
      'allegiances': this.allegiances,
      'books': this.books,
      'povBooks': this.povBooks,
      'tvSeries': this.tvSeries,
      'playedBy': this.playedBy,
    };
  }

  factory DetailCharacter.fromMap(Map<String, dynamic> map) {
    return DetailCharacter(
      id: map['id'] as int,
      name: map['name'] as String,
      gender: map['gender'] as String,
      culture: map['culture'] as String,
      born: map['born'] as String,
      died: map['died'] as String,
      titles: map['titles'] as List<String>,
      aliases: map['aliases'] as List<String>,
      father: map['father'] as DetailCharacterCharacter,
      mother: map['mother'] as DetailCharacterCharacter,
      spouse: map['spouse'] as DetailCharacterCharacter,
      allegiances: map['allegiances'] as List<DetailCharacterHouse>,
      books: map['books'] as List<DetailCharacterBook>,
      povBooks: map['povBooks'] as List<DetailCharacterBook>,
      tvSeries: map['tvSeries'] as List<String>,
      playedBy: map['playedBy'] as List<String>,
    );
  }

//</editor-fold>
}
