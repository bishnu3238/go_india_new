import 'package:flutter/material.dart';
import 'package:go_india_rider/utility/constants/colors.dart';

 import '../../../package/package/package.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    var theme  = Theme.of(context);
    return Column(
      children: <Widget>[

        const Spacer(),
        Text(
          "GOINDIA",
          style: TextStyle(
            fontSize: getScreenWidth(36),
            color: theme.colorScheme.primaryContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        ImageShower(
          imageUrl: image!,
          imgType: ImgType.local,
          height: getScreenHeight(265),
          width: getScreenWidth(235),
        ),
      ],
    );
  }
}