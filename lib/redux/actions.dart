import 'package:flutter_github/models/search_result.dart';

class SearchResultAction {
  SearchResultAction({this.searchResult});

  final SearchResult searchResult;
}

class SearchAction {
  SearchAction(this.queryStr);

  final String queryStr;
}

class ErrorAction {}

class LoadingAction {}
