import 'package:flutter/material.dart';

import '../../utility/utils.dart';

class PageIndicator extends StatelessWidget {
  final int itemLength;
  final int currentIndex;
  final Color activeColor;
  final Duration duration;
  final Color inactiveColor;
  final BoxDecoration? decoration;
  final double dotSize;
  final double spacing;

  const PageIndicator({
    super.key,
    required this.itemLength,
    required this.currentIndex,
    this.activeColor = kPrimeColor,
    this.inactiveColor = normalGrey,
    this.duration = oneSecond,
    this.decoration,
    this.dotSize = 8,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration, //BoxDecoration(
      // color: normalGrey.withOpacity(0.3),
      // border: Border.all(color: kGrey3),
      // borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          itemLength,
          (index) => AnimatedContainer(
            duration: duration,
            margin: edgeInsets.copyWith(right: 5),
            height: 6,
            width: currentIndex == index ? 20 : 6,
            decoration: BoxDecoration(
              color: currentIndex == index ? activeColor : inactiveColor,
              borderRadius: radius5,
            ),
          ),
        ),
      ),
    );
  }
}
