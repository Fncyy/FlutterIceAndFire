part of 'book_detail_bloc.dart';

@immutable
abstract class BookDetailState {
  const BookDetailState();
}

class BookDetailLoadingState extends BookDetailState {
  static final BookDetailLoadingState _instance = BookDetailLoadingState._();

  factory BookDetailLoadingState() => _instance;

  BookDetailLoadingState._();
}

class BookDetailErrorState extends BookDetailState {
  static final BookDetailErrorState _instance = BookDetailErrorState._();

  factory BookDetailErrorState() => _instance;

  BookDetailErrorState._();
}

class BookDetailContentReadyState extends BookDetailState with EquatableMixin {
  final DetailBook book;

  BookDetailContentReadyState({required this.book});

  @override
  List<Object> get props => [book];
}
