// TODO Implement this library.

import 'package:go_india_rider/utility/utils.dart';

class SharedPreferencesDb {
  SharedPreferencesDb._();
  static final SharedPreferencesDb _instance = SharedPreferencesDb._();
  static SharedPreferencesDb get instance => _instance;

  Future<void> init() async {
    checkIsFirstTimeInstallOrNot();
  }
}

void checkIsFirstTimeInstallOrNot() {
  bool isFirstTime = pref.containsKey(isFirstTimeInstallKey);
  if (isFirstTime) {
    isFirstTimeInstall = pref.getBool(isFirstTimeInstallKey) ?? false;
  } else {
    pref.setBool(isFirstTimeInstallKey, true);
  }
}
