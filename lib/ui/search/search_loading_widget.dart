import 'package:flutter/material.dart';

class SearchLoadingWidget extends StatelessWidget {
  final bool isLoading;

  SearchLoadingWidget(this.isLoading);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: isLoading ? 1.0 : 0.0,
      child: Container(
        alignment: FractionalOffset.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
