import 'package:go_india_rider/navigation_system/export.dart';
import 'package:go_india_rider/screens/login_screen/log_in_cubit.dart';
import 'package:go_india_rider/screens/login_screen/login_screen.dart';
import 'package:go_india_rider/utility/utils.dart';
import 'package:go_router/go_router.dart';

class LoginScreenRoute {
  static GoRoute page() => GoRoute(
      path: RouteName.logIn.path,
      name: RouteName.logIn.cName,
      builder: (ctx, state) =>   LoginScreen(cubit: get<LoginCubit>(),));
}
