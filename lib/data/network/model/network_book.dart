import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_book.g.dart';

@immutable
@JsonSerializable()
class NetworkBook {
  final String url;
  final String name;
  final String isbn;
  final List<String> authors;
  final int numberOfPages;
  final String publisher;
  final String country;
  final String mediaType;
  final String released;
  final List<String> povCharacters;

  NetworkBook(
      this.url,
      this.name,
      this.isbn,
      this.authors,
      this.numberOfPages,
      this.publisher,
      this.country,
      this.mediaType,
      this.released,
      this.povCharacters);

  static const fromJsonFactory = _$NetworkBookFromJson;

  factory NetworkBook.fromJson(Map<String, dynamic> json) => _$NetworkBookFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkBookToJson(this);
}
