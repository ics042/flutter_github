import 'package:flutter_github/models/enums.dart';
import 'package:flutter_github/models/search_result_item.dart';

class SearchResult {
  SearchResult(this.results, this.searchResultType);

  final List<SearchResultItem> results;
  final SearchResultType searchResultType;

  factory SearchResult.fromJson(dynamic json) {
    final List items = (json as List)
        .cast<Map<String, Object>>()
        .map((Map<String, Object> o) => SearchResultItem.fromJson(o))
        .toList();
    return SearchResult(items,
        items.isEmpty ? SearchResultType.empty : SearchResultType.hasResult);
  }

  factory SearchResult.init() =>
      SearchResult(<SearchResultItem>[], SearchResultType.noQuery);

  bool isNoQuery() => this.searchResultType == SearchResultType.noQuery;

  bool isEmpty() => this.searchResultType == SearchResultType.empty;

  bool hasResult() => this.searchResultType == SearchResultType.hasResult;
}
