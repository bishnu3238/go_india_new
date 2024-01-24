import 'package:flutter/material.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_router/go_router.dart';

enum Screen {
  splash,
  login,
  home,
  error,
  onBoarding,
  startApplication,
  support,
  profileSettings,
  otp,
  welcome,
  welcomeDriverDetails,
  addVehicle,
  driverInitialDetails,
  bankAccountDetails,
  profilePicture,
  driverLicenseNo,
  drivingLicense,
  aadharCard,
  rcCertificate,
  pollutionUnderControl,
  vehicleInsurance,
  panCard,
  vehiclePermit,
  fitnessCertificate,
  vehicleAudit,
  identity,
  userProfile,
  setPreferences,
  setLanguage,
  waitForVerification,
  signUp,
  editProfile,
  videoShowing,
  quiz,
  score,
  rides,
  indexHome,
  history,
  settings,
}

extension AppPageExtension on Screen {
  String get path => '/$name'; // e.g : "/splash", "/userProfile"

  String get subPath => name; // e.g : "splash", "userProfile"

  String get cName => name.toUpperCase(); // e.g : "SPLASH" "USERPROFILE"

  String get branchKey => "Screen$name";

  GlobalKey<NavigatorState> get globalNavKey => GlobalKey<NavigatorState>();

  String get subCName {
    String enumString = toString().split('.').last;
    List<String> words = enumString.split(RegExp('(?=[A-Z])'));
    String result = words
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join('-');
    return result;
  } // e.g: "Slash", "User-Profile"

  String get capitalName {
    String enumString = toString().split('.').last;
    List<String> words = enumString.split(RegExp('(?=[A-Z])'));
    String result =
        words.map((word) => word[0].toUpperCase() + word.substring(1)).join('');
    return result;
  } // e.g: "Slash", "User Profile"

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
