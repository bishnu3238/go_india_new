import 'package:go_india_rider/navigation_system/export.dart';
import 'package:go_india_rider/screens/splash_screen/export.dart';
import 'package:go_india_rider/screens/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../utility/utils.dart';

class SplashScreenRoute {
  static GoRoute page() => GoRoute(
      path: RouteName.splash.path,
      name: RouteName.splash.cName,
      builder: (ctx, state) {
        return SplashScreen(cubit: get<SplashCubit>());
      });
}
