import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_rider/navigation_system/export.dart';
import 'package:go_india_rider/utility/constants/duration.dart';

import 'export.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState(itemCount: onboardingData.length));

  void onPageChange(int index) {
    emit(state.copyWith(currentPage: index));
  }

  void onPress(BuildContext context) {
    if (state.currentPage == onboardingData.length - 1) {
      RouteName.logIn.go(context);
    } else {
      state.pageController.nextPage(duration: oneSecond, curve: Curves.easeIn);
      emit(state.copyWith(currentPage: state.currentPage+1));
    }
  }
}
