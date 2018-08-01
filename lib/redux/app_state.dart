import 'package:flutter_github/redux/search_state.dart';

class AppState {
  final SearchState searchState;

  AppState({this.searchState});

  factory AppState.init() => AppState(searchState: SearchState.init());
}
