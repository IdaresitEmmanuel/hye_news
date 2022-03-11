part of 'news_bloc.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const factory NewsEvent.started() = _Started;
  const factory NewsEvent.search(String value) = _Search;
  const factory NewsEvent.getHeadlines() = _GetHeadlines;
  const factory NewsEvent.getPoliticsFeed() = _GetPoliticsFeed;
  const factory NewsEvent.getEntertainmentFeed() = _GetEntertainmentFeed;
  const factory NewsEvent.getBusinessFeed() = _GetBusinessFeed;
  const factory NewsEvent.getSportsFeed() = _GetSportsFeed;
  const factory NewsEvent.getHealthFeed() = _GetHealthFeed;
  const factory NewsEvent.clearSearch() = _ClearSearch;
}
