// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookmark/models/models.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:bookmark/consts/consts.dart';
import 'package:bookmark/screens/screens.dart';
import 'package:bookmark/services/services.dart';
import 'package:bookmark/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({
    Key? key,
    // required this.imageUrl,
    // required this.title,
    // required this.readingTime,
    // required this.url,
    // required this.dateToShow,
  }) : super(key: key);
  // final String imageUrl, title, readingTime, url, dateToShow;

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color buttonColor = Utils(context).getButtonColor;
    final newsModelProvider = Provider.of<NewsModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, NewsDetailsScreen.routeName,
                arguments: newsModelProvider.publishedAt);
          },
          child: Stack(
            children: [
              Container(
                height: 60,
                width: 60,
                color: buttonColor,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 60,
                  width: 60,
                  color: buttonColor,
                ),
              ),
              Container(
                color: Theme.of(context).cardColor,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: newsModelProvider.publishedAt,
                        child: FancyShimmerImage(
                          height: size.height * 0.12,
                          width: size.height * 0.12,
                          boxFit: BoxFit.fill,
                          imageUrl: newsModelProvider.imageUrl,
                        ),
                      ),
                    ),
                    const HorizontalSpacing(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            newsModelProvider.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            style: smallTextStyle.copyWith(),
                          ),
                          const VerticalSpacing(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 16,
                                        color: buttonColor,
                                      ),
                                      Text(
                                        ' ${newsModelProvider.readingTimeText}',
                                        style: smallTextStyle,
                                      ),
                                    ],
                                  ),
                                  const VerticalSpacing(5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.date_range,
                                        size: 16,
                                        color: buttonColor,
                                      ),
                                      Text(
                                        ' ${newsModelProvider.dateToShow}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: smallTextStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const VerticalSpacing(10),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: NewDetailsWebView(
                                        url: newsModelProvider.url,
                                      ),
                                      inheritTheme: true,
                                      ctx: context,
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.link,
                                  size: 30,
                                  color: buttonColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
