part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent();
}

class SearchSendFetchEvent extends SearchEvent {
  final SearchType type;
  final String query;

  SearchSendFetchEvent(this.type, this.query);
}
