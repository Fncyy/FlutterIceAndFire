import 'package:floor/floor.dart';

@Entity(tableName: "books")
class FloorBook {
  @primaryKey
  int id;
  String name;
  String isbn;
  int numberOfPages;
  String publisher;
  String country;
  String mediaType;
  String released;

  FloorBook(
    this.id,
    this.name,
    this.isbn,
    this.numberOfPages,
    this.publisher,
    this.country,
    this.mediaType,
    this.released,
  );
}
