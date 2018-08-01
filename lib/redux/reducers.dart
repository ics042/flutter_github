import 'package:redux/redux.dart';

import 'package:flutter_github/redux/app_state.dart';
import 'package:flutter_github/redux/actions.dart';
import 'package:flutter_github/redux/search_state.dart';
import 'package:flutter_github/models/enums.dart';

AppState appReducer(AppState state, dynamic action) =>
    AppState(searchState: searchReducers(state.searchState, action));

final searchReducers = combineReducers<SearchState>([
  TypedReducer<SearchState, SearchResultAction>(_onResult),
  TypedReducer<SearchState, ErrorAction>(_onError),
  TypedReducer<SearchState, LoadingAction>(_onLoad)
]);

SearchState _onResult(
        SearchState state, SearchResultAction searchResultAction) =>
    state.copyWith(
        result: searchResultAction.searchResult, status: Status.success);

SearchState _onError(SearchState state, ErrorAction action) =>
    state.copyWith(status: Status.error);

SearchState _onLoad(SearchState state, LoadingAction action) =>
    state.copyWith(status: Status.loading);
