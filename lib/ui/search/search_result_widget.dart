import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_github/models/search_result.dart';
import 'package:flutter_github/models/search_result_item.dart';

class SearchResultWidget extends StatelessWidget {
  final SearchResult result;

  SearchResultWidget(this.result);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: result != null && result.hasResult() ? 1.0 : 0.0,
      child: ListView.builder(
        itemCount: result?.results?.length ?? 0,
        itemBuilder: (context, index) {
          final item = result.results[index];
          return InkWell(
            onTap: () => _launchURL(item.url),
            child: Container(
              alignment: FractionalOffset.center,
              margin: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 16.0),
                    child: Hero(
                      tag: item.fullName,
                      child: ClipOval(
                        child: Image.network(
                          item.avatarUrl,
                          width: 56.0,
                          height: 56.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            top: 6.0,
                            bottom: 4.0,
                          ),
                          child: Text(
                            "${item.fullName}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${item.url}",
                            style: TextStyle(
                              fontFamily: "Hind",
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showItem(BuildContext context, SearchResultItem item) {
    Navigator.push(
      context,
      MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return Scaffold(
            resizeToAvoidBottomPadding: false,
            body: GestureDetector(
              key: Key(item.avatarUrl),
              onTap: () => Navigator.pop(context),
              child: SizedBox.expand(
                child: Hero(
                  tag: item.fullName,
                  child: Image.network(
                    item.avatarUrl,
                    width: MediaQuery.of(context).size.width,
                    height: 300.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
