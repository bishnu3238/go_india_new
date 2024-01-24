// ignore_for_file: dead_code, unused_local_variable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_india_rider/navigation_system/route_names.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/login_screen/login_screen_route.dart';
import '../screens/onboarding_screen/export.dart';
import '../screens/splash_screen/export.dart';

var initialPage = RouteName.splash.path;

class RouteConfig {
  RouteConfig();
  static GoRouter get router => _goRouter;

  static final GoRouter _goRouter = GoRouter(
    routerNeglect: true,
    debugLogDiagnostics: true,
    initialLocation: initialPage,
    restorationScopeId: 'router',
    routes: <RouteBase>[
      SplashScreenRoute.page(),
      OnboardingScreenRoute.page(),
      LoginScreenRoute.page(),
    ],
    errorBuilder: (ctx, state) => Scaffold(
      body: Center(child: Text(state.extra.toString())),
    ),
    redirect: (ctx, state) {
      return null;
    },
  );
}

class GoRouterRefreshBloc<BLOC extends BlocBase<STATE>, STATE,
    BLOC2 extends BlocBase<STATE2>, STATE2> extends ChangeNotifier {
  GoRouterRefreshBloc(BLOC bloc, BLOC2 bloc2) {
    _blocStream = bloc.stream.listen(
      (STATE _) => notifyListeners(),
    );
    _blocStream2 = bloc2.stream.listen(
      (STATE2 _) => notifyListeners(),
    );
  }

  late final StreamSubscription<STATE> _blocStream;
  late final StreamSubscription<STATE2> _blocStream2;

  @override
  void dispose() {
    _blocStream.cancel();
    _blocStream2.cancel();
    super.dispose();
  }
}
