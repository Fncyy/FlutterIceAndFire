// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkBook _$NetworkBookFromJson(Map<String, dynamic> json) => NetworkBook(
      json['url'] as String,
      json['name'] as String,
      json['isbn'] as String,
      (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
      json['numberOfPages'] as int,
      json['publisher'] as String,
      json['country'] as String,
      json['mediaType'] as String,
      json['released'] as String,
      (json['povCharacters'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NetworkBookToJson(NetworkBook instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'isbn': instance.isbn,
      'authors': instance.authors,
      'numberOfPages': instance.numberOfPages,
      'publisher': instance.publisher,
      'country': instance.country,
      'mediaType': instance.mediaType,
      'released': instance.released,
      'povCharacters': instance.povCharacters,
    };
