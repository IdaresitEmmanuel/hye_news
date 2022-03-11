import 'package:flutter/material.dart';
import 'package:hye_news/presentation/core/theme/colors.dart';

class HTabBar extends StatelessWidget {
  const HTabBar({
    Key? key,
    required this.tabController,
    this.onTap,
  }) : super(key: key);
  final TabController tabController;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
              onTap: onTap,
              isScrollable: true,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              unselectedLabelStyle: const TextStyle(fontSize: 14.0),
              indicatorColor: HColors.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3.0,
              labelColor: HColors.primaryColor,
              unselectedLabelColor: Colors.grey,
              controller: tabController,
              tabs: const [
                Tab(text: "Politics"),
                Tab(text: "Entertainment"),
                Tab(text: "Business"),
                Tab(text: "Sports"),
                Tab(text: "Health"),
              ]),
          const Divider(
            height: 2.0,
            thickness: .5,
          )
        ],
      ),
    );
  }
}
