import 'package:bookmark/consts/consts.dart';
import 'package:bookmark/services/services.dart';
import 'package:bookmark/widgets/widgets.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color buttonColor = Utils(context).getButtonColor;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: GestureDetector(
          onTap: () {},
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
                      child: FancyShimmerImage(
                          height: size.height * 0.12,
                          width: size.height * 0.12,
                          boxFit: BoxFit.fill,
                          imageUrl:
                              'https://classic.exame.com/wp-content/uploads/2016/09/size_960_16_9_smartphone-metro1.jpg?quality=70&strip=info&w=960'),
                    ),
                    const HorizontalSpacing(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'title ' * 100,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            style: smallTextStyle.copyWith(),
                          ),
                          const VerticalSpacing(5),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 16,
                                color: buttonColor,
                              ),
                              const HorizontalSpacing(10),
                              Text(
                                'Reading time',
                                style: smallTextStyle,
                              ),
                            ],
                          ),
                          const VerticalSpacing(5),
                          Row(
                            children: [
                              Icon(
                                Icons.link,
                                size: 16,
                                color: buttonColor,
                              ),
                              const HorizontalSpacing(10),
                              Expanded(
                                child: Text(
                                  'data ' * 8,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: smallTextStyle,
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
