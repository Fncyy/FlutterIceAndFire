part of 'search_bloc.dart';

@immutable
abstract class SearchState {
  const SearchState();
}

class SearchInitialState extends SearchState {
  static final SearchInitialState _instance = SearchInitialState._();

  factory SearchInitialState() => _instance;

  SearchInitialState._();
}

class SearchLoadingState extends SearchState {
  static final SearchLoadingState _instance = SearchLoadingState._();

  factory SearchLoadingState() => _instance;

  SearchLoadingState._();
}

class SearchContentState extends SearchState {
  final List<dynamic> results;

  SearchContentState({required this.results});
}

class SearchContentReadyState extends SearchContentState with EquatableMixin {
  SearchContentReadyState({required List<dynamic> results})
      : super(results: results);

  @override
  List<Object> get props => [results];
}

class SearchContentErrorState extends SearchContentState with EquatableMixin {
  SearchContentErrorState({required List<dynamic> results})
      : super(results: results);

  @override
  List<Object> get props => [results];
}
