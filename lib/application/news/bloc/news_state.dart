part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    required bool isSearching,
    required News searchResult,
    required bool topHeadlinesIsLoading,
    required News topHeadlines,
    required bool politicsIsLoading,
    required News politics,
    required bool entertainmentIsLoading,
    required News entertainment,
    required bool businessIsLoading,
    required News business,
    required bool sportsIsLoading,
    required News sports,
    required bool healthIsLoading,
    required News health,
  }) = _NewsState;
  factory NewsState.initial() => NewsState(
        isSearching: false,
        searchResult: News.empty(),
        topHeadlinesIsLoading: false,
        topHeadlines: News.empty(),
        politicsIsLoading: false,
        politics: News.empty(),
        entertainmentIsLoading: false,
        entertainment: News.empty(),
        businessIsLoading: false,
        business: News.empty(),
        sportsIsLoading: false,
        sports: News.empty(),
        healthIsLoading: false,
        health: News.empty(),
      );
}
