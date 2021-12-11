part of 'book_detail_bloc.dart';

@immutable
abstract class BookDetailEvent {
  const BookDetailEvent();
}

class LoadBookEvent extends BookDetailEvent {
  final int id;

  LoadBookEvent(this.id);
}