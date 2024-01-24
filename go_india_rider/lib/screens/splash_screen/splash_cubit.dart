import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_rider/navigation_system/export.dart';

import '../../utility/constants/export.dart';
import 'export.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.init());

  Future initial() async {
    Future.delayed(
        oneSecond,
        () => emit(
            state.copyWith(isWaiting: false, isLoading: false, isDone: true)));
  }

  void zoomable() {
    Future.delayed(
        twoSecond, () => emit(state.copyWith(width: 1 / 3, height: 1 / 6)));
  }

  void nextPage(BuildContext context) async {
    Future.delayed(
      twoSecond,
      () => isFirstTimeInstall
          ? RouteName.logIn.go(context)
          : RouteName.onBoarding.go(context),
    );
  }
}
