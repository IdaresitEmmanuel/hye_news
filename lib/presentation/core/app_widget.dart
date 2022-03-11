import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hye_news/application/news/bloc/news_bloc.dart';
import 'package:hye_news/injection.dart';
import 'package:hye_news/presentation/core/theme/theme.dart';
import 'package:hye_news/presentation/root/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                getIt<NewsBloc>()..add(const NewsEvent.started()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hye News',
        theme: HTheme.lightTheme,
        home: const HomePage(),
      ),
    );
  }
}
