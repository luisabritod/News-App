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
  late Color baseShimmerColor, highlightShimmerColor, widgetShimmerColor;

  @override
  void didChangeDependencies() {
    var utils = Utils(context);
    baseShimmerColor = utils.baselineShimmerColor;
    highlightShimmerColor = utils.highlightShimmerColor;
    widgetShimmerColor = utils.widgetShimmerColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color buttonColor = Utils(context).getButtonColor;
    return Expanded(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return ArticlesShimmerEffectWidget(
              buttonColor: buttonColor,
              baseShimmerColor: baseShimmerColor,
              highlightShimmerColor: highlightShimmerColor,
              size: size,
              borderRadius: borderRadius,
              widgetShimmerColor: widgetShimmerColor);
        },
        itemCount: 20,
      ),
    );
  }
}
