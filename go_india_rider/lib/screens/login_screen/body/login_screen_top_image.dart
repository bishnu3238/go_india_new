import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_india_rider/utility/constants/export.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Text(
          "LOG IN",
          style: gideonRoman(
              color: theme.colorScheme.inversePrimary, weight: fwb, size: 20),
        ),
        const SizedBox(height: 10),
        AutoSizeText(
          'Your Journey, Your Way',
          style:
              gQuan(color: theme.colorScheme.inversePrimary.withOpacity(0.7)),
        ),
        const SizedBox(height: 30),
        // Row(
        //   children: [
        //     const Spacer(),
        //     Expanded(
        //       flex: 8,
        //       child: SvgPicture.asset(loginThreeImage,height: 200),
        //     ),
        //     const Spacer(),
        //   ],
        // ),
        // const SizedBox(height: 30),
      ],
    );
  }
}
