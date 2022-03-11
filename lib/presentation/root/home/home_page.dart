import 'package:flutter/material.dart';
import 'package:hye_news/application/news/bloc/news_bloc.dart';
import 'package:hye_news/presentation/core/theme/colors.dart';
import 'package:hye_news/presentation/root/home/pages/health_page.dart';
import 'package:hye_news/presentation/root/home/widgets/home_tab_bar.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'package:hye_news/presentation/root/home/pages/business_page.dart';
import 'package:hye_news/presentation/root/home/pages/entertainment_page.dart';
import 'package:hye_news/presentation/root/home/pages/politics_page.dart';
import 'package:hye_news/presentation/root/home/pages/sports_page.dart';
import 'package:hye_news/presentation/root/home/widgets/home_appbar.dart';
import 'package:hye_news/presentation/root/home/widgets/top_headlines.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//·
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  final PreloadPageController _pageController = PreloadPageController();

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBar(),
            Expanded(
              child: NestedScrollView(
                physics: const BouncingScrollPhysics(),
                headerSliverBuilder: (context, isScrolled) {
                  return [
                    SliverAppBar(
                      collapsedHeight: 220.0,
                      expandedHeight: 220.0,
                      backgroundColor: Colors.transparent,
                      flexibleSpace: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: const Text(
                              "Breaking News",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 16.0),
                            ),
                          ),
                          SizedBox(
                            height: 200.0,
                            child: BlocBuilder<NewsBloc, NewsState>(
                              builder: (context, state) {
                                if (state.topHeadlinesIsLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                        color: HColors.primaryColor),
                                  );
                                } else {
                                  return ListView.builder(
                                    cacheExtent: state
                                        .topHeadlines.articles.length
                                        .toDouble(),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 20.0),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        state.topHeadlines.articles.length,
                                    itemBuilder: (context, index) {
                                      return TopHeadline(
                                        article:
                                            state.topHeadlines.articles[index],
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverPersistentHeader(
                      floating: true,
                      pinned: true,
                      delegate: SliverTabBar(
                        tabBar: HTabBar(
                          tabController: _tabController,
                          onTap: (index) {
                            _pageController.animateToPage(index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                        ),
                      ),
                    ),
                  ];
                },
                body: PreloadPageView(
                  preloadPagesCount: 5,
                  controller: _pageController,
                  onPageChanged: (index) {
                    _tabController.animateTo(index);
                  },
                  children: const [
                    PoliticsPage(),
                    EntertainmentPage(),
                    BusinessPage(),
                    SportsPage(),
                    HealthPage(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SliverTabBar extends SliverPersistentHeaderDelegate {
  final Widget tabBar;
  SliverTabBar({
    required this.tabBar,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return tabBar;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
