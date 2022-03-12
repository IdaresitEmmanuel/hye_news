import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hye_news/application/news/bloc/news_bloc.dart';
import 'package:hye_news/presentation/core/theme/colors.dart';
import 'package:hye_news/presentation/root/home/widgets/article_tile.dart';

class EntertainmentPage extends StatefulWidget {
  const EntertainmentPage({Key? key}) : super(key: key);

  @override
  State<EntertainmentPage> createState() => _EntertainmentPageState();
}

class _EntertainmentPageState extends State<EntertainmentPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state.entertainmentIsLoading) {
          return Center(
              child: CircularProgressIndicator(color: HColors.primaryColor));
        } else {
          return ListView.separated(
              cacheExtent: state.health.articles.length.toDouble(),
              shrinkWrap: true,
              itemCount: state.entertainment.articles.length,
              separatorBuilder: (_, index) => const Divider(
                    indent: 20.0,
                    endIndent: 20.0,
                  ),
              itemBuilder: (context, index) {
                return ArticleTile(
                  article: state.entertainment.articles[index],
                  keyword: "entertainment",
                );
              });
        }
      },
    );
  }
}
