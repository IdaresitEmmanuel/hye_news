import 'package:dartz/dartz.dart';
import 'package:hye_news/domain/news/i_news_facade.dart';
import 'package:hye_news/domain/news/news.dart';
import 'package:hye_news/domain/news/news_failure.dart';
import 'package:hye_news/infrastructure/news/api_key.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@Injectable(as: INewsFacade)
class NewsFacade extends INewsFacade {
  final String baseUrl = "https://newsapi.org/v2/";
  final String headlineEndPoint = "top-headlines?";
  final String searchEndPoint = "everything?";
  final Map<String, String> headers = {
    "Authorization": apiKey,
    "Content-Type": "application/json"
  };

  @override
  Future<Either<NewsFailure, News>> fetchBusinessHeadlines() async {
    final response = await http.get(
        Uri.parse(
            baseUrl + headlineEndPoint + "country=ng" + "&category=business"),
        headers: headers);
    if (response.statusCode == 200) {
      return right(News.fromJson(response.body));
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
        headers: headers);
    if (response.statusCode == 200) {
      return right(News.fromJson(response.body));
    }
    return left(const NewsFailure.networkFailure());
  }

  @override
  Future<Either<NewsFailure, News>> fetchPoliticsHeadlines() async {
    final response = await http.get(
        Uri.parse(
            baseUrl + headlineEndPoint + "country=ng" + "&category=politics"),
        headers: headers);
    if (response.statusCode == 200) {
      return right(News.fromJson(response.body));
    }
    return left(const NewsFailure.networkFailure());
  }

  @override
  Future<Either<NewsFailure, News>> fetchSportsHeadlines() async {
    final response = await http.get(
        Uri.parse(
            baseUrl + headlineEndPoint + "country=ng" + "&category=sports"),
        headers: headers);

    if (response.statusCode == 200) {
      return right(News.fromJson(response.body));
    }
    return left(const NewsFailure.networkFailure());
  }

  @override
  Future<Either<NewsFailure, News>> fetchTopHeadlines() async {
    final response = await http.get(
        Uri.parse(baseUrl + searchEndPoint + "q=popular, trending"),
        headers: headers);

    if (response.statusCode == 200) {
      return right(News.fromJson(response.body));
    }
    return left(const NewsFailure.networkFailure());
  }

  @override
  Future<Either<NewsFailure, News>> search(String query) async {
    final response = await http.get(
        Uri.parse(baseUrl + searchEndPoint + "q=$query"),
        headers: headers);
    if (response.statusCode == 200) {
      return right(News.fromJson(response.body));
    }
    return left(const NewsFailure.networkFailure());
  }

  @override
  Future<Either<NewsFailure, News>> fetchHealthHeadlines() async {
    final response = await http.get(
        Uri.parse(
            baseUrl + headlineEndPoint + "country=ng" + "&category=health"),
        headers: headers);

    if (response.statusCode == 200) {
      return right(News.fromJson(response.body));
    }
    return left(const NewsFailure.networkFailure());
  }
}
