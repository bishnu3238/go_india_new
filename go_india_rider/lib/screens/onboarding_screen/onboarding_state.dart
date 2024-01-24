import 'package:flutter/cupertino.dart';
import 'package:go_india_rider/screens/onboarding_screen/body/others.dart';

class OnboardingState {
  final int currentPage;
  final int totalCount;
  final PageController pageController;
  OnboardingState(
      {this.currentPage = 0,
      required int itemCount,
      PageController? pageController})
      : totalCount = itemCount,
        pageController = pageController ?? PageController(initialPage: 0);

  OnboardingState copyWith({
    int? totalCount,
    int? currentPage,
  }) =>
      OnboardingState(
          itemCount: totalCount ?? this.totalCount,
          currentPage: currentPage ?? this.currentPage);
}
