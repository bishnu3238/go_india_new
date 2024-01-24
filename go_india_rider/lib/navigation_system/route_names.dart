import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum RouteName {
  splash,
  onBoarding,
  logIn,
  signUp,
  forgetPassword,
  otp,
  profile,
  editProfile,
  setting,
  home,
}


extension RouteExtension on RouteName {
  String get path => '/$name'; // e.g : "/splash"

  String get subPath => name; // e.g : "splash"

  String get cName => name.toUpperCase(); // e.g : "SPLASH"

  String get capitalName {
    String enumString = toString().split('.').last;
    List<String> words = enumString.split(RegExp('(?=[A-Z])'));
    String result = words
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
    return result;
  }

  String nameRoute(BuildContext context, Map<String, String>? pathParams,
      Map<String, String>? queryParams) =>
      GoRouter.of(context).namedLocation(
        cName,
        pathParameters: pathParams ?? {},
        queryParameters: queryParams ?? {},
      );

  void go(
      BuildContext context, {
        Map<String, String>? pathParams,
        Map<String, String>? queryParams,
        Object? extra,
      }) =>
      context.go(
        nameRoute(context, pathParams, queryParams),
        extra: extra,
      );
}
