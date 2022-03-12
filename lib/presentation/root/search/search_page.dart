import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hye_news/application/news/bloc/news_bloc.dart';
import 'package:hye_news/presentation/core/theme/colors.dart';
import 'package:hye_news/presentation/root/home/widgets/article_tile.dart';
import 'package:hye_news/presentation/root/search/widgets/search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    context.read<NewsBloc>().add(const NewsEvent.clearSearch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            SearchBar(
              searchController: searchController,
            ),
            Expanded(child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state.isSearching) {
                  return Center(
                      child: CircularProgressIndicator(
                          color: HColors.primaryColor));
                }
                return ListView.builder(
                    cacheExtent: state.searchResult.articles.length.toDouble(),
                    itemCount: state.searchResult.articles.length,
                    itemBuilder: (context, index) {
                      return ArticleTile(
                        article: state.searchResult.articles[index],
                        keyword: searchController.text,
                      );
                    });
              },
            ))
          ],
        ),
      )),
    );
  }
}
