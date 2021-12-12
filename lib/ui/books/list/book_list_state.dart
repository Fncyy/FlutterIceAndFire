import 'package:app_of_ice_and_fire/domain/model/book.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class BookListState {
  const BookListState();
}

class BookListLoadingState extends BookListState {
  static final BookListLoadingState _instance = BookListLoadingState._();

  factory BookListLoadingState() => _instance;

  BookListLoadingState._();
}

abstract class BookListContentState extends BookListState {
  final List<Book> books;

  BookListContentState({required this.books});
}

class BookListContentReadyState extends BookListContentState with EquatableMixin {
  BookListContentReadyState({required List<Book> books}) : super(books: books);

  @override
  List<Object> get props => [books];
}

class BookListErrorState extends BookListContentState with EquatableMixin {
  BookListErrorState({required List<Book> books}) : super(books: books);

  @override
  List<Object> get props => [books];
}