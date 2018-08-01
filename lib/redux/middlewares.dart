import 'dart:async';

import 'package:async/async.dart';
import 'package:redux/redux.dart';

import 'package:flutter_github/redux/app_state.dart';
import 'package:flutter_github/api/GithubApi.dart';
import 'package:flutter_github/redux/actions.dart';

class SearchMiddleware implements MiddlewareClass<AppState> {
  final GithubApi githubApi;

  SearchMiddleware({GithubApi githubApi})
      : this.githubApi = githubApi ?? GithubApi();

  Timer _timer;
  CancelableOperation<Store<AppState>> _operation;

  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    if (action is SearchAction) {
      _timer?.cancel();
      _operation?.cancel();
      _timer = Timer(Duration(milliseconds: 250), () {
        store.dispatch(LoadingAction());
        _operation = CancelableOperation.fromFuture(
            (githubApi.search(action.queryStr))
                .then((result) =>
                    store..dispatch(SearchResultAction(searchResult: result)))
                .catchError((e, s) => store..dispatch(ErrorAction())));
      });
    }
    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }
}
