part of 'book_detail_bloc.dart';

@immutable
abstract class BookDetailState {
  const BookDetailState();
}

class Loading extends BookDetailState {
  static final Loading _instance = Loading._();

  factory Loading() => _instance;

  Loading._();
}

class Error extends BookDetailState {
  static final Error _instance = Error._();

  factory Error() => _instance;

  Error._();
}

class ContentReady extends BookDetailState with EquatableMixin {
  final DetailBook book;

  ContentReady({required this.book});

  @override
  List<Object> get props => [book];
}
