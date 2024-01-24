import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:go_india_rider/screens/login_screen/export.dart';
import 'package:go_india_rider/screens/onboarding_screen/export.dart';

import '../../package/package/package.dart';
import '../../screens/splash_screen/export.dart';
import '../utils.dart';

class GetItRegisterSingleton {
  GetItRegisterSingleton._();
  static final GetItRegisterSingleton _instance = GetItRegisterSingleton._();
  static GetItRegisterSingleton get instance => _instance;

  void init() async {
    // Packages
    get.registerLazySingleton<Connectivity>(() => Connectivity());

    // AppNavigator
    get.registerLazySingleton(() => AppNavigator());

    // Network service
    get.registerLazySingleton<NetworkService>(() => NetworkService());

    // Notifier
    get.registerLazySingleton<Notifier>(() => Notifier());

    // Stores
    get.registerLazySingleton<ThemeStore>(() => ThemeStore());

    /*Splash Screen*/
    get.registerLazySingleton<SplashCubit>(() => SplashCubit()..initial());

    /*Onboarding Screen*/
    get.registerLazySingleton<OnboardingCubit>(() => OnboardingCubit());

    /*Login Screen*/
    get.registerLazySingleton<LoginCubit>(
      () => LoginCubit(get(),  ),
    );
  }
}
