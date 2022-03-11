import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hye_news/domain/news/i_news_facade.dart';
import 'package:hye_news/domain/news/news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final INewsFacade _iNewsFacade;
  NewsBloc(this._iNewsFacade) : super(NewsState.initial());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    yield* event.map(started: (event) async* {
      add(const NewsEvent.getHeadlines());
      add(const NewsEvent.getPoliticsFeed());
      add(const NewsEvent.getEntertainmentFeed());
      add(const NewsEvent.getBusinessFeed());
      add(const NewsEvent.getSportsFeed());
      add(const NewsEvent.getHealthFeed());
    }, getHeadlines: (event) async* {
      yield state.copyWith(topHeadlinesIsLoading: true);
      final result = await _iNewsFacade.fetchTopHeadlines();
      yield result.fold((l) {
        return state.copyWith();
      }, (r) {
        return state.copyWith(topHeadlinesIsLoading: false, topHeadlines: r);
      });
    }, getBusinessFeed: (event) async* {
      yield state.copyWith(businessIsLoading: true);
      final result = await _iNewsFacade.fetchBusinessHeadlines();
      yield result.fold((l) {
        return state.copyWith();
      }, (r) {
        return state.copyWith(businessIsLoading: false, business: r);
      });
    }, getEntertainmentFeed: (event) async* {
      yield state.copyWith(entertainmentIsLoading: true);
      final result = await _iNewsFacade.fetchEntertainmentHeadlines();
      yield result.fold((l) {
        return state.copyWith();
      }, (r) {
        return state.copyWith(entertainmentIsLoading: false, entertainment: r);
      });
    }, getPoliticsFeed: (event) async* {
      yield state.copyWith(politicsIsLoading: true);
      final result = await _iNewsFacade.fetchPoliticsHeadlines();
      yield result.fold((l) {
        return state.copyWith();
      }, (r) {
        return state.copyWith(politicsIsLoading: false, politics: r);
      });
    }, getSportsFeed: (event) async* {
      yield state.copyWith(sportsIsLoading: true);
      final result = await _iNewsFacade.fetchSportsHeadlines();
      yield result.fold((l) {
        return state.copyWith();
      }, (r) {
        return state.copyWith(sportsIsLoading: false, sports: r);
      });
    }, getHealthFeed: (event) async* {
      yield state.copyWith(healthIsLoading: true);
      final result = await _iNewsFacade.fetchHealthHeadlines();
      yield result.fold((l) {
        return state.copyWith();
      }, (r) {
        return state.copyWith(healthIsLoading: false, health: r);
      });
    }, search: (event) async* {
      yield state.copyWith(isSearching: true);
      final result = await _iNewsFacade.search(event.value);
      yield result.fold((l) {
        return state.copyWith();
      }, (r) {
        return state.copyWith(isSearching: false, searchResult: r);
      });
    }, clearSearch: (event) async* {
      yield state.copyWith(isSearching: false, searchResult: News.empty());
    });
  }
}
