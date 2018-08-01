import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_github/models/search_result.dart';

class GithubApi {
  final String baseUrl;
  final HttpClient client;

  GithubApi({
    HttpClient client,
    this.baseUrl = "https://api.github.com/search/repositories?q=",
  }) : this.client = client ?? HttpClient();

  Future<SearchResult> search(String queryStr) async {
    if (queryStr.isNotEmpty) {
      final request = await client.getUrl(Uri.parse("$baseUrl$queryStr"));
      final response = await request.close();
      final results =
          json.decode(await response.transform(utf8.decoder).join());
      return SearchResult.fromJson(results['items']);
    } else {
      return SearchResult.init();
    }
  }
}
