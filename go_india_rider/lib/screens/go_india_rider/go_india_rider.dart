import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_rider/package/package/package.dart';
import '../../navigation_system/export.dart';
import '../../utility/utils.dart';

class GoIndiaRider extends StatelessWidget {
  const GoIndiaRider({super.key});

  @override
  Widget build(BuildContext context) {
    screenUtils.init(context);
    return BlocBuilder(
      bloc: get.get<ThemeStore>(),
      builder: (context, state) {
        state as ThemeState;
        /*device status bar customization*/
        state.inti(context);
        return MaterialApp.router(
          title: appName,
          themeMode: state.themeMode,
          theme: state.light.toTheme,
          darkTheme: state.dark.toTheme,
          routerConfig: RouteConfig.router,
          restorationScopeId: appName,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
