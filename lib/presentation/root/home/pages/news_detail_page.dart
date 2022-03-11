import 'package:flutter/material.dart';
import 'package:hye_news/domain/news/article.dart';
import 'package:hye_news/presentation/core/theme/colors.dart';
import 'package:intl/intl.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({Key? key, required this.article}) : super(key: key);
  final Article article;
  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              alignment: Alignment.centerLeft,
              child: InkResponse(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios)),
            ),
            Container(
              width: double.maxFinite,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                widget.article.source.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
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
                        image: Image.network(widget.article.urlToImage ?? "")
                            .image),
                    color: HColors.cardColor,
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                widget.article.title ?? "Unknown",
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                      "${widget.article.author} | ${DateFormat("MMMM dd, yyyy").format(widget.article.publishedAt!)}"),
                ],
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                widget.article.content ?? "m",
                // style: const TextStyle(height: 40.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
