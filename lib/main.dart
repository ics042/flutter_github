import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_github/redux/app_state.dart';
import 'package:flutter_github/redux/reducers.dart';
import 'package:flutter_github/redux/middlewares.dart';
import 'package:flutter_github/ui/search/search_page.dart';

void main() {
  final store = Store<AppState>(appReducer,
      initialState: AppState.init(), middleware: [SearchMiddleware()]);

  runApp(new MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(home: SearchPage()),
    );
  }
}
