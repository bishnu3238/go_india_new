import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_india/utility/constant/constant.dart';


class ProgressBar extends StatelessWidget {
  const ProgressBar({required this .animation,
    Key? key,
  }) : super(key: key);

final Animation animation;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10,// 35
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF3F4768), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child:  Stack(
            children: [
              // LayoutBuilder provide us the available space for the conatiner
              // constraints.maxWidth needed for our animation
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  // from 0 to 1 it takes 60s
                  width: constraints.maxWidth * animation.value,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: edgeInsets0520,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${(animation.value * 60).round()} sec"),
                      SvgPicture.asset(clockImage),
                    ],
                  ),
                ),
              ),
            ],
          ),

    );
  }
}
