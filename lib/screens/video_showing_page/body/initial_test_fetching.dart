
import 'package:flutter/material.dart';
import 'package:go_india/package/package/package.dart';

import '../../../../../utility/utility/utility.dart';

class InitialTestFetching extends StatelessWidget {
  const InitialTestFetching({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Shimmer(
          enabled: true,
          period: oneSecond,
          gradient:
          LinearGradient(colors: [kGrey, kGrey2.withOpacity(0.2)]),
          child: Center(
            child: Container(
              width: getScreenWidth(kLayoutWidth - 10),
              height: getScreenHeight(kLayoutHeight * 1 / 3),
              decoration: BoxDecoration(
                  borderRadius: radius10, color: kPrimeColor),
            ),
          ),
        )
      ],
    );
  }
}
