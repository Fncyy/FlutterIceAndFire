import 'package:floor/floor.dart';

@Entity(tableName: "bookAuthors")
class FloorBookAuthor {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String name;
  int bookId;

  FloorBookAuthor(
    this.name,
    this.bookId,
  );
}
