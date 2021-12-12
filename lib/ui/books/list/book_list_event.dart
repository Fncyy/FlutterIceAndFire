import 'package:flutter/cupertino.dart';

@immutable
abstract class BookListEvent {
  const BookListEvent();
}

class BookListLoadBooksEvent extends BookListEvent {
  static final BookListLoadBooksEvent _instance = BookListLoadBooksEvent._();

  factory BookListLoadBooksEvent() => _instance;

  BookListLoadBooksEvent._();
}