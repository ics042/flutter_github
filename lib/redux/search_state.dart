import 'package:flutter_github/models/enums.dart';
import 'package:meta/meta.dart';

import 'package:flutter_github/models/search_result.dart';

class SearchState {
  SearchState({@required this.result, @required this.status, this.msg});

  final Status status;
  final SearchResult result;
  final String msg;

  factory SearchState.init() =>
      SearchState(result: SearchResult.init(), status: Status.idle);

  SearchState copyWith({Status status, SearchResult result, String msg}) =>
      SearchState(
          result: result ?? this.result,
          status: status ?? this.status,
          msg: msg ?? this.msg);

  bool isLoading() => this.status == Status.loading;

  bool hasError() => this.status == Status.error;
}
