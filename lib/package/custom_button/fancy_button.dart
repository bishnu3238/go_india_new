import 'package:flutter/material.dart';

import '../../utility/utility/utility.dart';

class FancyButton extends StatelessWidget {
  const FancyButton({
    super.key,
    this.onTap,
    this.edgeInsets = edgeInsets10,
    this.color,
    this.gColor,
    this.widget,
    this.text,
    this.bRadius = radiusA12,
  });
  final VoidCallback? onTap;
  final EdgeInsets edgeInsets;
  final Color? color;
  final Gradient? gColor;
  final Widget? widget;
  final String? text;
  final BorderRadius bRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, //() => Get.to(QuizScreen()),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: edgeInsets, //EdgeInsets.all(kDefaultPadding * 0.75), // 15
        decoration: BoxDecoration(
          gradient: gColor, // kPrimaryGradient,
          borderRadius: bRadius, // BorderRadius.all(Radius.circular(12)),
        ),
        child: widget ??
            Text(
              text ?? "",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.black),
            ),
      ),
    );
  }
}
