import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_rider/navigation_system/export.dart';
import 'package:go_india_rider/package/package/package.dart';

import '../../../utility/constants/export.dart';
import '../export.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
            bloc: get<OnboardingCubit>(),
            builder: (context, state) {
              return Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                      itemCount: state.totalCount,
                      controller: state.pageController,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: get.get<OnboardingCubit>().onPageChange,
                      itemBuilder: (context, index) => OnboardingContent(
                        image: onboardingData[index]["image"],
                        text: onboardingData[index]['text'],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
                      child: Column(
                        children: <Widget>[
                          const Spacer(),
                          PageIndicator(
                            itemLength: onboardingData.length,
                            currentIndex: state.currentPage,
                          ),
                          const Spacer(flex: 3),
                          ElButton(
                            text:
                                onboardingData.length == (state.currentPage + 1)
                                    ? "Continue"
                                    : 'Next',
                            press: () =>
                                get.get<OnboardingCubit>().onPress(context),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
