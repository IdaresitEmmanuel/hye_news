import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hye_news/application/news/bloc/news_bloc.dart';
import 'package:hye_news/presentation/core/theme/colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<bool> _clearNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(children: [
        InkResponse(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios),
        ),
        Expanded(
          child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xFFECEAEA),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/search.png",
                    width: 20.0,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          _clearNotifier.value = false;
                          context
                              .read<NewsBloc>()
                              .add(const NewsEvent.clearSearch());
                        } else {
                          _clearNotifier.value = true;
                        }
                      },
                      onSubmitted: (value) {
                        context.read<NewsBloc>().add(NewsEvent.search(value));
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        isDense: true,
                        isCollapsed: true,
                        hintText: "Search...",
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: _clearNotifier,
                      builder: (context, bool isNotEmpty, child) {
                        return isNotEmpty
                            ? InkResponse(
                                onTap: () {
                                  _searchController.clear();
                                  _clearNotifier.value = false;
                                  context
                                      .read<NewsBloc>()
                                      .add(const NewsEvent.clearSearch());
                                },
                                child: const Icon(Icons.close_rounded),
                              )
                            : const SizedBox.shrink();
                      })
                ],
              )),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: const Icon(
            Icons.filter_list_rounded,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
              color: HColors.primaryColor,
              borderRadius: BorderRadius.circular(5.0)),
        )
      ]),
    );
  }
}
