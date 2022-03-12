import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hye_news/application/news/bloc/news_bloc.dart';
import 'package:hye_news/presentation/core/theme/colors.dart';
import 'package:hye_news/presentation/root/home/widgets/article_tile.dart';

class SportsPage extends StatefulWidget {
  const SportsPage({Key? key}) : super(key: key);

  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state.sportsIsLoading) {
          return Center(
              child: CircularProgressIndicator(color: HColors.primaryColor));
        } else {
          return ListView.separated(
              cacheExtent: state.health.articles.length.toDouble(),
              shrinkWrap: true,
              itemCount: state.sports.articles.length,
              separatorBuilder: (_, index) => const Divider(
                    indent: 20.0,
                    endIndent: 20.0,
                  ),
              itemBuilder: (context, index) {
                return ArticleTile(
                  article: state.sports.articles[index],
                  keyword: "sports",
                );
              });
        }
      },
    );
  }
}
