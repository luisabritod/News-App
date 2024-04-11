import 'package:bookmark/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ArticlesShimmerEffectWidget extends StatelessWidget {
  const ArticlesShimmerEffectWidget({
    super.key,
    required this.buttonColor,
    required this.baseShimmerColor,
    required this.highlightShimmerColor,
    required this.size,
    required this.borderRadius,
    required this.widgetShimmerColor,
  });

  final Color buttonColor;
  final Color baseShimmerColor;
  final Color highlightShimmerColor;
  final Size size;
  final BorderRadius borderRadius;
  final Color widgetShimmerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
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
              child: Shimmer.fromColors(
                baseColor: baseShimmerColor,
                highlightColor: highlightShimmerColor,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: buttonColor,
                        height: size.height * 0.12,
                        width: size.height * 0.12,
                      ),
                    ),
                    const HorizontalSpacing(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: size.height * 0.06,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: borderRadius,
                              color: widgetShimmerColor,
                            ),
                          ),
                          const VerticalSpacing(5),
                          Row(
                            children: [
                              ClipOval(
                                child: Container(
                                  height: size.height * 0.025,
                                  width: size.height * 0.025,
                                  color: widgetShimmerColor,
                                ),
                              ),
                              const HorizontalSpacing(5),
                              Container(
                                height: size.height * 0.025,
                                width: size.width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius,
                                  color: widgetShimmerColor,
                                ),
                              ),
                            ],
                          ),
                          const VerticalSpacing(5),
                          Row(
                            children: [
                              ClipOval(
                                child: Container(
                                  height: size.height * 0.025,
                                  width: size.height * 0.025,
                                  color: widgetShimmerColor,
                                ),
                              ),
                              const HorizontalSpacing(5),
                              Container(
                                height: size.height * 0.025,
                                width: size.width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius,
                                  color: widgetShimmerColor,
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
            ),
          ],
        ),
      ),
    );
  }
}
