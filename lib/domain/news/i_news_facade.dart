import 'package:dartz/dartz.dart';
import 'package:hye_news/domain/news/news.dart';
import 'package:hye_news/domain/news/news_failure.dart';

abstract class INewsFacade {
  Future<Either<NewsFailure, News>> fetchTopHeadlines();
  Future<Either<NewsFailure, News>> search(String query);
  // categories
  Future<Either<NewsFailure, News>> fetchEntertainmentHeadlines();
  Future<Either<NewsFailure, News>> fetchPoliticsHeadlines();
  Future<Either<NewsFailure, News>> fetchBusinessHeadlines();
  Future<Either<NewsFailure, News>> fetchSportsHeadlines();
  Future<Either<NewsFailure, News>> fetchHealthHeadlines();
}
