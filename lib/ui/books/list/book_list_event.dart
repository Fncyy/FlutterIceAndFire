import 'package:flutter/cupertino.dart';

@immutable
abstract class BookListEvent {
  const BookListEvent();
}

class LoadBooksEvent extends BookListEvent {
  static final LoadBooksEvent _instance = LoadBooksEvent._();

  factory LoadBooksEvent() => _instance;

  LoadBooksEvent._();
}