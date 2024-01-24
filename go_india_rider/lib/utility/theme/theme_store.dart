import 'package:flutter/material.dart';
import 'package:go_india_rider/package/common/common.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../database/export.dart';
import 'theme_state.dart';

class ThemeStore extends HydratedCubit<ThemeState> {
  ThemeStore() : super(ThemeState.init());

  void setTheme(ThemeMode themeMode) =>
      emit(state.copyWith(themeMode: themeMode));

  @override
  ThemeState? fromJson(Map<String, dynamic> json) => ThemeState(
      themeMode: (json[themeModeKey] as String?)?.theme ?? ThemeMode.system);

  @override
  Map<String, dynamic>? toJson(ThemeState state) =>
      {themeModeKey: state.themeMode.name};
}
