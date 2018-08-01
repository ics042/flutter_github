import 'package:flutter/material.dart';

class SearchInfoWidget extends StatelessWidget {
  final bool isVisible;

  SearchInfoWidget(this.isVisible);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: isVisible ? 1.0 : 0.0,
      child: Container(
        alignment: FractionalOffset.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.info, color: Colors.green[400], size: 80.0),
            Container(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                "Enter a search term to begin",
                style: TextStyle(
                  color: Colors.green[300],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
