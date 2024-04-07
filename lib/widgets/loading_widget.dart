import 'package:bookmark/services/services.dart';
import 'package:bookmark/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  BorderRadius borderRadius = BorderRadius.circular(18);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color buttonColor = Utils(context).getButtonColor;
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
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
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
                            color: buttonColor,
                          ),
                        ),
                        const VerticalSpacing(5),
                        Row(
                          children: [
                            ClipOval(
                              child: Container(
                                height: size.height * 0.025,
                                width: size.height * 0.025,
                                color: buttonColor,
                              ),
                            ),
                            const HorizontalSpacing(5),
                            Container(
                              height: size.height * 0.025,
                              width: size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: borderRadius,
                                color: buttonColor,
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
                                color: buttonColor,
                              ),
                            ),
                            const HorizontalSpacing(5),
                            Container(
                              height: size.height * 0.025,
                              width: size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: borderRadius,
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
    );
  }
}
