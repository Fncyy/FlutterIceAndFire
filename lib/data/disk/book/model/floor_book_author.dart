import 'package:floor/floor.dart';

@Entity(tableName: "bookAuthors")
class FloorBookAuthor {
  @primaryKey
  String name;
  int bookId;

  FloorBookAuthor(
    this.name,
    this.bookId,
  );
}
