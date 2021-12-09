import 'package:app_of_ice_and_fire/domain/model/book.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class BookListState {
  const BookListState();
}

class Loading extends BookListState {
  static final Loading _instance = Loading._();

  factory Loading() => _instance;

  Loading._();
}

abstract class Content extends BookListState {
  final List<Book> books;

  Content({required this.books});
}

class ContentReady extends Content with EquatableMixin {
  ContentReady({required List<Book> books}) : super(books: books);

  @override
  List<Object> get props => [books];
}

class Error extends Content with EquatableMixin {
  Error({required List<Book> books}) : super(books: books);

  @override
  List<Object> get props => [books];
}