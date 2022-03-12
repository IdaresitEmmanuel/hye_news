import 'package:flutter/material.dart';
import 'package:hye_news/domain/news/article.dart';
import 'package:hye_news/presentation/core/theme/colors.dart';
import 'package:hye_news/presentation/root/home/pages/news_detail_page.dart';

class RelatedNewsTile extends StatelessWidget {
  const RelatedNewsTile(
      {Key? key, required this.article, required this.keyword})
      : super(key: key);
  final Article article;
  final String keyword;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  NewsDetailPage(article: article, keyword: keyword))),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Stack(children: [
          Container(
            height: 160.0,
            width: 120.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.network(article.urlToImage ?? "").image,
                    fit: BoxFit.cover),
                color: HColors.cardColor,
                borderRadius: BorderRadius.circular(16.0)),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 160.0,
            width: 120.0,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.25),
                borderRadius: BorderRadius.circular(16.0)),
            child: Text(
              article.title ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}
