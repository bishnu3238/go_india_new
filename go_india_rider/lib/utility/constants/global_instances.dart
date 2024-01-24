import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:go_india_rider/package/common/common.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences pref ;
GetIt get = GetIt.instance;
SmartAuth smartAuth = SmartAuth();
Connectivity connectivity = Connectivity();
ScreenUtils screenUtils = ScreenUtils.instance;
