import 'package:bookmark/consts/consts.dart';
import 'package:bookmark/models/models.dart';
import 'package:bookmark/provider/provider.dart';
import 'package:bookmark/services/services.dart';
import 'package:bookmark/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchController;
  late final FocusNode focusNode;

  @override
  initState() {
    super.initState();
    _searchController = TextEditingController();
    focusNode = FocusNode();
  }

  List<NewsModel>? searchList = [];
  bool isSearching = false;

  @override
  void dispose() {
    if (mounted) {
      _searchController.dispose();
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    final themeState = Provider.of<DarkThemeProvider>(context);
    final searchProvider = Provider.of<NewsProvider>(context);

    return Container(
      color: themeState.getDarkTheme ? darkScaffoldColor : lightScaffoldColor,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BackButton(
                        color: color,
                      ),
                      const HorizontalSpacing(10),
                      Flexible(
                        child: TextField(
                          focusNode: focusNode,
                          showCursor: true,
                          controller: _searchController,
                          style: TextStyle(
                            color: color,
                          ),
                          autofocus: true,
                          textInputAction: TextInputAction.search,
                          keyboardType: TextInputType.text,
                          onEditingComplete: () async {
                            searchList =
                                await searchProvider.searchNewsProvider(
                              query: _searchController.text,
                            );
                            isSearching = true;
                            focusNode.unfocus();
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: color,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: color,
                              ),
                              onPressed: () {
                                _searchController.clear();
                                focusNode.unfocus();
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpacing(20),
                if (!isSearching && searchList!.isEmpty)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MasonryGridView.count(
                        itemCount: searchKeywords.length,
                        crossAxisCount: 4,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                border: Border.all(color: color),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    searchKeywords[index],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                // const EmptyWidget(
                //   imagePath: 'assets/images/search.png',
                //   message: 'Ops! No results found.',
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
