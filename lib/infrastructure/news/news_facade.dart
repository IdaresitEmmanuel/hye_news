import 'package:dartz/dartz.dart';
import 'package:hye_news/domain/news/i_news_facade.dart';
import 'package:hye_news/domain/news/news.dart';
import 'package:hye_news/domain/news/news_failure.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

@Injectable(as: INewsFacade)
class NewsFacade extends INewsFacade {
  final String baseUrl = "https://newsapi.org/v2/";
  final String apiKey = "1d218d8f8dbc43e6af9bad32f6a0d45b";
  final String headlineEndPoint = "top-headlines?";
  final String searchEndPoint = "everything?";

  @override
  Future<Either<NewsFailure, News>> fetchBusinessHeadlines() async {
    final response = await http.get(
        Uri.parse(
            baseUrl + headlineEndPoint + "country=ng" + "&category=business"),
        headers: {
          "Authorization": apiKey,
          "Content-Type": "application/json",
        });
    if (response.statusCode == 200) {
      return right(News.fromMap(jsonDecode(response.body)));
    }
    return left(const NewsFailure.networkFailure());
  }

  @override
  Future<Either<NewsFailure, News>> fetchEntertainmentHeadlines() async {
    final response = await http.get(
        Uri.parse(baseUrl +
            headlineEndPoint +
            "country=ng" +
            "&category=entertainment"),
        headers: {
          "Authorization": apiKey,
          "Content-Type": "application/json",
        });
    if (response.statusCode == 200) {
      return right(News.fromMap(jsonDecode(response.body)));
    }
    return left(const NewsFailure.networkFailure());
  }

  @override
  Future<Either<NewsFailure, News>> fetchPoliticsHeadlines() async {
    final response = await http.get(
        Uri.parse(
            baseUrl + headlineEndPoint + "country=ng" + "&category=politics"),
        headers: {
          "Authorization": apiKey,
          "Content-Type": "application/json",
        });
    if (response.statusCode == 200) {
      return right(News.fromMap(jsonDecode(response.body)));
    }
    return left(const NewsFailure.networkFailure());
  }

  @override
  Future<Either<NewsFailure, News>> fetchSportsHeadlines() async {
    final response = await http.get(
        Uri.parse(
            baseUrl + headlineEndPoint + "country=ng" + "&category=sports"),
        headers: {
          "Authorization": apiKey,
          "Content-Type": "application/json",
        });
    if (response.statusCode == 200) {
      return right(News.fromMap(jsonDecode(response.body)));
    }
    return left(const NewsFailure.networkFailure());
  }

  @override
  Future<Either<NewsFailure, News>> fetchTopHeadlines() async {
    final response = await http
        .get(Uri.parse(baseUrl + headlineEndPoint + "country=ng"), headers: {
      "Authorization": apiKey,
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      return right(News.fromJson(jsonDecode(response.body)));
    }
    return left(const NewsFailure.networkFailure());
  }

  @override
  Future<Either<NewsFailure, News>> search(String query) async {
    final response = await http
        .get(Uri.parse(baseUrl + searchEndPoint + "q=$query"), headers: {
      "Authorization": apiKey,
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      // print(response.body);
      return right(News.fromMap(jsonDecode(response.body)));
    }
    return left(const NewsFailure.networkFailure());
  }
}
