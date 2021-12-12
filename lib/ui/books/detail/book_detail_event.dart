part of 'book_detail_bloc.dart';

@immutable
abstract class BookDetailEvent {
  const BookDetailEvent();
}

class BookDetailLoadBookEvent extends BookDetailEvent {
  final int id;

  BookDetailLoadBookEvent(this.id);
}