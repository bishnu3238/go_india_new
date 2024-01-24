import 'package:go_india_rider/navigation_system/export.dart';
import 'package:go_router/go_router.dart';

import 'export.dart';

class OnboardingScreenRoute {
  static GoRoute page() => GoRoute(
      path: RouteName.onBoarding.path,
      name: RouteName.onBoarding.cName,
      builder: (ctx, state) => const OnboardingScreen());
}
