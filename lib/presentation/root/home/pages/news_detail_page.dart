import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hye_news/application/news/bloc/news_bloc.dart';
import 'package:hye_news/domain/news/article.dart';
import 'package:hye_news/presentation/core/theme/colors.dart';
import 'package:hye_news/presentation/root/home/widgets/related_news_tile.dart';
import 'package:intl/intl.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({Key? key, required this.article, required this.keyword})
      : super(key: key);
  final Article article;
  final String keyword;
  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  void initState() {
    context.read<NewsBloc>().add(NewsEvent.search(widget.keyword));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  InkResponse(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios)),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Text(
                        widget.article.source.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Hero(
                      tag: "article_thumbnail",
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        width: double.maxFinite,
                        height: 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                        widget.article.urlToImage ?? "")
                                    .image),
                            color: HColors.cardColor,
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Text(
                        widget.article.title ?? "Unknown",
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            height: 8.0,
                            width: 8.0,
                            decoration: BoxDecoration(
                                color: HColors.primaryColor,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            "${widget.article.author} | ${DateFormat("MMMM dd, yyyy").format(widget.article.publishedAt!)}",
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Text(
                        widget.article.content ?? "Unknown",
                        // "MUKACHEVO, Ukraine — Ukrainians in cities across the country awoke Saturday to withering bombardment as Russian forces pummeled targets including Kyiv, the capital, and Mykolaiv, a port on Ukraine’s strategically significant southern coast." +
                        //     "\nA health official in Mykolaiv said a cancer hospital had been struck — though no deaths were reported — while residents in Kyiv reported loud explosions and air raid sirens piercing the night. Russian ground forces were around 15 miles from the center of Kyiv, while the cities of Kharkiv, Chernihiv, Mariupol and Sumy were encircled and suffering heavy shelling, according to an intelligence update from the British defense ministry Saturday." +
                        //     "\nOfficials in Sumy, a northeastern region where heavy fighting has taken place, said they would attempt to evacuate civilians along humanitarian corridors. The rush to flee comes as Western officials say they have intelligence that Russia may be preparing to use chemical weapons against Ukraine. They also cautioned that the Kremlin might attempt a “false-flag” operation to try to shift the blame for such an attack to Ukrainians, or even the West." +
                        //     "\nIn a new address, Ukrainian President Volodymyr Zelensky, who has been calling for more Western weapons and aid, compared Russia’s actions — which allegedly included the detention of the mayor of Melitopol — to those of the Islamic State. “If you are becoming an analogue of ISIS terrorists, then what is the point of talking to you about something at all?” he said.",
                        // maxLines: 4,
                        style: const TextStyle(height: 2.0),
                      ),
                    ),
                    SizedBox(
                      height: 240,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: const Text("Related News",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            child: BlocBuilder<NewsBloc, NewsState>(
                              builder: (context, state) {
                                if (state.isSearching) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: HColors.primaryColor,
                                    ),
                                  );
                                }
                                List<Article> articleList =
                                    state.searchResult.articles;
                                articleList.shuffle();
                                return ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 15.0),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        state.searchResult.articles.length,
                                    itemBuilder: (context, index) {
                                      var article = articleList[index];
                                      return RelatedNewsTile(
                                          article: article,
                                          keyword: widget.keyword);
                                    });
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
