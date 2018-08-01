import 'package:meta/meta.dart';

class SearchResultItem {
  SearchResultItem(this.fullName, this.url, this.avatarUrl);

  final String fullName;
  final String url;
  final String avatarUrl;

  factory SearchResultItem.fromJson(Map<String, Object> json) {
    return SearchResultItem(
        json['full_name'] as String,
        json['html_url'] as String,
        (json['owner'] as Map<String, Object>)['avatar_url'] as String);
  }
}
