import 'package:flutter/material.dart';

class EmptyResultWidget extends StatelessWidget {
  final bool isEmpty;

  EmptyResultWidget(this.isEmpty);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: isEmpty ? 1.0 : 0.0,
      child: Container(
        alignment: FractionalOffset.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.warning,
              color: Colors.yellow[200],
              size: 80.0,
            ),
            Container(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                "No results",
                style: TextStyle(color: Colors.yellow[100]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
