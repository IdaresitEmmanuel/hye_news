import 'package:flutter/material.dart';
import 'package:hye_news/domain/news/article.dart';
import 'package:hye_news/presentation/core/theme/colors.dart';
import 'package:hye_news/presentation/core/theme/dimensions.dart';
import 'package:hye_news/presentation/root/home/pages/news_detail_page.dart';
import 'package:intl/intl.dart';

class TopHeadline extends StatelessWidget {
  const TopHeadline({Key? key, required this.article}) : super(key: key);
  final Article article;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => NewsDetailPage(article: article))),
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5.0),
        height: 200,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: HColors.cardColor,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(article.urlToImage ?? "").image)),
        child: Stack(
          children: [
            Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title ?? "Title",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: HDimensions.bodyTextMedium)),
                  const SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        height: 10.0,
                        width: 10.0,
                        decoration: BoxDecoration(
                            color: HColors.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                          "${article.author ?? "Hyebreed"}\n${DateFormat("MMMM dd, yyyy").format(article.publishedAt!)}",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.9))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
