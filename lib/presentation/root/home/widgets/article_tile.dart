import 'package:flutter/material.dart';
import 'package:hye_news/domain/news/article.dart';
import 'package:hye_news/presentation/core/theme/colors.dart';
import 'package:hye_news/presentation/root/home/pages/news_detail_page.dart';
import 'package:intl/intl.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({Key? key, required this.article, required this.keyword})
      : super(key: key);
  final Article article;
  final String keyword;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  NewsDetailPage(article: article, keyword: keyword))),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title ?? "Hye title",
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 10.0),
                  Row(
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
                      Expanded(
                        child: Text(
                            "${article.author} | ${DateFormat("MMMM dd, yyyy").format(article.publishedAt!)} · 4 hours ago",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black.withOpacity(0.7)),
                            overflow: TextOverflow.ellipsis),
                      )
                    ],
                  )
                ],
              ),
            ),
            Hero(
              tag: "article_thumbnail",
              child: Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                    color: HColors.cardColor,
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(article.urlToImage ?? "").image)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
