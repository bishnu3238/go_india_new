import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_india_rider/package/common/common.dart';

import '../constants/export.dart';
import 'theme.dart';

class ThemeState {
  final ThemeMode themeMode;

  ThemeState({required this.themeMode});
  factory ThemeState.init() => ThemeState(themeMode: ThemeMode.system);

  // ThemeData get light => lightTheme;
  // // ThemeData get light => lightTheme;
  // ThemeData get dark => darkTheme;
  // // ThemeData get dark => darkTheme;

  FlexColorScheme get light => lightTheme;
  // ThemeData get light => lightTheme;
  FlexColorScheme get dark => darkTheme;
  // ThemeData get dark => darkTheme;

  var statusLight = const SystemUiOverlayStyle(
    statusBarColor: kLight,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
  var statusDark = const SystemUiOverlayStyle(
    statusBarColor: kDark,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  Future<void> inti(BuildContext context) async {
    var isDarkMode = MediaQuery.of(context).platformBrightness;
    'Brightness: $isDarkMode'.log();
    var themeMode = isDarkMode == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(themeMode ? statusDark : statusLight);
  }

  ThemeState copyWith({ThemeMode? themeMode}) =>
      ThemeState(themeMode: themeMode ?? this.themeMode);
}
