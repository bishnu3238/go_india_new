import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_rider/navigation_system/export.dart';
import 'package:go_india_rider/package/common/screen_utils.dart';
import 'package:go_india_rider/package/custom_widget/image_shower.dart';
import 'package:go_india_rider/screens/splash_screen/export.dart';
import 'package:go_india_rider/utility/utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, required this.cubit});
  final SplashCubit cubit;

  @override
  Widget build(BuildContext context) {
    screenUtils.init(context);
    return Scaffold(
      body: BlocConsumer<SplashCubit, SplashState>(
          bloc: cubit,
          listener: (ctx, state) => state.isDone ? cubit.nextPage(context) : null,
          builder: (context, state) {
            return Center(
              child: ImageShower(
                imageUrl: appLogo,
                imgType: ImgType.local,
                width: getScreenWidth(100),
                height: getScreenWidth(100),
              ),
            );
          }),
    );
  }
}
