import 'package:flutter/material.dart';
import 'package:go_india/routes/app_routes.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_router/go_router.dart';
import '../../package/package/package.dart';
import '../../utility/utility/utility.dart';
import 'export.dart';

class HomeRoute {
  static final shellNavigatorRide =
      GlobalKey<NavigatorState>(debugLabel: 'ride');
  static final shellNavigatorIndex =
      GlobalKey<NavigatorState>(debugLabel: 'index');

  static StatefulShellRoute page() => StatefulShellRoute.indexedStack(
          restorationScopeId: Screen.home.cName,
          // parentNavigatorKey: shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) {
            return Home(
              key: state.pageKey,
              shell: navigationShell,
              bloc: get<HomeBloc>(
                param1: HomeInitialParams(navigationShell: navigationShell),
              ),
            );
          },
          branches: [
            StatefulShellBranch(
              initialLocation: Screen.indexHome.path,
              routes: <RouteBase>[
                GoRoute(
                  path: Screen.indexHome.path,
                  name: Screen.indexHome.cName,
                  builder: (BuildContext context, GoRouterState state) =>
                      IndexHome(key: state.pageKey),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: Screen.rides.path,
                  name: Screen.rides.cName,
                  builder: (BuildContext context, GoRouterState state) =>
                      Rides(key: state.pageKey),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: Screen.history.path,
                  name: Screen.history.cName,
                  builder: (BuildContext context, GoRouterState state) =>
                      History(key: state.pageKey),
                ),
              ],
            ),
            StatefulShellBranch(
              restorationScopeId: Screen.settings.branchKey,
              routes: <RouteBase>[
                GoRoute(
                  path: Screen.settings.path,
                  name: Screen.settings.cName,
                  builder: (BuildContext context, GoRouterState state) =>
                      Settings(key: state.pageKey),
                ),
              ],
            ),
          ]);

  ///
  // static GoRoute page() => GoRoute(
  //       path: Screen.home.path,
  //       name: Screen.home.cName,
  //       builder: (ctx, state) => Home(
  //         key: state.pageKey,
  //         bloc: get<HomeBloc>(
  //           param1: HomeInitialParams(),
  //         ),
  //       ),
  //     );
}
