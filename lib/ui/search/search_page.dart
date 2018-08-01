import 'package:flutter/material.dart';
import 'package:flutter_github/redux/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_github/redux/actions.dart';
import 'package:flutter_github/ui/search/search_error_widget.dart';
import 'package:flutter_github/ui/search/search_info_widget.dart';
import 'package:flutter_github/ui/search/search_loading_widget.dart';
import 'package:flutter_github/ui/search/search_result_widget.dart';
import 'package:flutter_github/ui/search/empty_result_widget.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SearchViewModel>(
      converter: (store) => SearchViewModel(
          state: store.state,
          onTextChanged: (queryStr) => store.dispatch(SearchAction(queryStr))),
      builder: (BuildContext context, SearchViewModel vm) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              Flex(direction: Axis.vertical, children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 4.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Github...',
                    ),
                    style: TextStyle(
                      fontSize: 36.0,
                      fontFamily: "Hind",
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                    onChanged: vm.onTextChanged,
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      // Fade in an intro screen if no term has been entered
                      SearchInfoWidget(!vm.state.searchState.isLoading() &&
                          !vm.state.searchState.hasError() &&
                          vm.state.searchState.result.isNoQuery()),

                      // Fade in an Empty Result screen if the search contained
                      // no items
                      EmptyResultWidget(!vm.state.searchState.isLoading() &&
                          !vm.state.searchState.hasError() &&
                          vm.state.searchState.result.isEmpty()),

                      // Fade in a loading screen when results are being fetched
                      // from Github
                      SearchLoadingWidget(vm.state.searchState.isLoading()),

                      // Fade in an error if something went wrong when fetching
                      // the results
                      SearchErrorWidget(vm.state.searchState.hasError()),

                      // Fade in the Result if available
                      SearchResultWidget(!vm.state.searchState.hasError()
                          ? vm.state.searchState.result
                          : null),
                    ],
                  ),
                )
              ])
            ],
          ),
        );
      },
    );
  }
}

class SearchViewModel {
  final AppState state;
  final void Function(String queryStr) onTextChanged;

  SearchViewModel({this.state, this.onTextChanged});
}
