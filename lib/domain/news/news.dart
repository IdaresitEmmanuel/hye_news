import 'dart:convert';

import 'package:hye_news/domain/news/article.dart';

class News {
  News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<Article> articles;

  factory News.empty() => News(status: "", totalResults: 0, articles: []);

  factory News.fromJson(String str) => News.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory News.fromMap(Map<String, dynamic> json) => News(
        status: json["status"],
        totalResults: json["totalResults"],
        articles:
            List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toMap())),
      };
}
