import 'package:bookmark/screens/screens.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:bookmark/consts/consts.dart';
import 'package:bookmark/services/services.dart';
import 'package:bookmark/widgets/widgets.dart';
import '../provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newsTipe = NewsType.allNews;
  int currentPageIndex = 0;
  String sortBy = SortByType.publishedAt.name;
  List<DropdownMenuItem<String>> get dropDownItems {
    List<DropdownMenuItem<String>> menuItem = [
      DropdownMenuItem(
        value: SortByType.publishedAt.name,
        child: const Text('Published at'),
      ),
      DropdownMenuItem(
        value: SortByType.revelancy.name,
        child: const Text('Revelancy'),
      ),
      DropdownMenuItem(
        value: SortByType.popularity.name,
        child: const Text('Popularity'),
      ),
    ];
    return menuItem;
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color labelColor = Utils(context).getColor;
    final Color buttonColor = Utils(context).getButtonColor;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'News app',
          style: GoogleFonts.lobster(
            textStyle: TextStyle(
              color: labelColor,
              fontSize: 28,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.6,
            ),
          ),
        ),
        backgroundColor:
            themeState.getDarkTheme ? darkScaffoldColor : lightScaffoldColor,
        // foregroundColor: color,
        iconTheme: IconThemeData(color: labelColor),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const SearchScreen(),
                    inheritTheme: true,
                    ctx: context,
                  ));
            },
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                TabsWidget(
                  function: () {
                    if (newsTipe == NewsType.allNews) {
                      return;
                    }
                    setState(() {
                      newsTipe = NewsType.allNews;
                    });
                  },
                  label: 'All news',
                  color: newsTipe == NewsType.allNews
                      ? Theme.of(context).cardColor.withOpacity(0.8)
                      : Colors.transparent,
                  fontSize: newsTipe == NewsType.allNews ? 22 : 16,
                ),
                const HorizontalSpacing(10),
                TabsWidget(
                  function: () {
                    if (newsTipe == NewsType.topTrending) {
                      return;
                    }
                    setState(() {
                      newsTipe = NewsType.topTrending;
                    });
                  },
                  label: 'Top trending',
                  color: newsTipe == NewsType.topTrending
                      ? Theme.of(context).cardColor.withOpacity(0.8)
                      : Colors.transparent,
                  fontSize: newsTipe == NewsType.topTrending ? 22 : 16,
                ),
              ],
            ),
            const VerticalSpacing(10),
            newsTipe == NewsType.topTrending
                ? Container()
                : Column(
                    children: [
                      SizedBox(
                        height: kBottomNavigationBarHeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            PaginationButtonWidget(
                              buttonColor: buttonColor,
                              label: 'Prev',
                              function: () {
                                if (currentPageIndex == 0) return;
                                setState(() {
                                  currentPageIndex--;
                                });
                              },
                              textButtonColor: Colors.white,
                            ),
                            const HorizontalSpacing(10),
                            Flexible(
                              flex: 2,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: ((context, index) {
                                  return Center(
                                    child: PaginationButtonWidget(
                                      textButtonColor:
                                          currentPageIndex == index ||
                                                  themeState.getDarkTheme
                                              ? Colors.white
                                              : Colors.black,
                                      buttonColor: currentPageIndex == index
                                          ? buttonColor
                                          : Theme.of(context).cardColor,
                                      label: (index + 1).toString(),
                                      function: () {
                                        setState(() {
                                          currentPageIndex = index;
                                        });
                                      },
                                    ),
                                  );
                                }),
                              ),
                            ),
                            const HorizontalSpacing(10),
                            PaginationButtonWidget(
                              buttonColor: buttonColor,
                              textButtonColor: Colors.white,
                              label: 'Next',
                              function: () {
                                if (currentPageIndex == 4) return;
                                setState(() {
                                  currentPageIndex++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: DropdownButton(
                          dropdownColor: Theme.of(context).cardColor,
                          value: sortBy,
                          items: dropDownItems,
                          onChanged: (value) {},
                        ),
                      ),
                      const VerticalSpacing(15),
                    ],
                  ),
            newsTipe == NewsType.topTrending
                ? SizedBox(
                    height: size.height * 0.6,
                    child: Swiper(
                      autoplayDelay: 8000,
                      viewportFraction: 0.4,
                      itemWidth: size.width * 0.9,
                      layout: SwiperLayout.STACK,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const TopTrending();
                      },
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return const ArticlesWidget();
                      },
                      itemCount: 10,
                    ),
                  ),
            // const LoadingWidget(),
          ],
        ),
      ),
    );
  }
}
