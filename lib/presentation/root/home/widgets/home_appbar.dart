import 'package:flutter/material.dart';
import 'package:hye_news/presentation/core/theme/dimensions.dart';
import 'package:hye_news/presentation/root/search/search_page.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: HDimensions.largeText,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5.0),
            Text(
              "Wednessday, March 9th",
              style: TextStyle(
                  color: Theme.of(context).textTheme.caption!.color,
                  fontSize: HDimensions.caption,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        InkResponse(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const SearchPage())),
          child: Image.asset(
            "assets/images/search.png",
            width: 24.0,
          ),
        )
      ]),
    );
  }
}
