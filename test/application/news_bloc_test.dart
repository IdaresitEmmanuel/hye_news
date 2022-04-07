import 'package:flutter_test/flutter_test.dart';
import 'package:hye_news/application/news/bloc/news_bloc.dart';
import 'package:hye_news/infrastructure/news/news_facade.dart';

void main() {
  group('News bloc', () {
    test('initstate', () {
      expect(NewsBloc(NewsFacade()).state.toString(),
          NewsState.initial().toString());
    });

    // blocTest<NewsBloc, NewsState>(
    //   'emits [MyState] when MyEvent is added.',
    //   build: () => NewsBloc(NewsFacade()),
    //   act: (bloc) => bloc.add(const NewsEvent.getHeadlines()),
    //   expect: () => const <NewsState>[],
    // );
  });
}
