

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchBookLoadingSearchState extends SearchState {}

class SearchBookGetSearchsuccessStste extends SearchState {}

class SearchBookGetSearchErrorStste extends SearchState {
  final error;

  SearchBookGetSearchErrorStste(this.error);
}

