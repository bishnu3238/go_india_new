import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_rider/utility/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future initApp() async {
  /*
  It use for initialize Flutter widgets before the runApp() function is called.
  This is because the WidgetsFlutterBinding class is responsible for initializing
  the Flutter framework and providing the widgets with the resources they need to run.
  */
  WidgetsFlutterBinding.ensureInitialized();

  /*local storage (using [shara_preferences] package)*/
  pref = await SharedPreferences.getInstance();

  /*TODO: add firebase initialization*/

  /*storage for all the bloc state classes*/
  await Hydrated.instance.initialize();

  /*observer all the bloc changes and print in console*/
  Bloc.observer = AppBlocObserver();

  /*dependency injection(Using [get_it] package)*/
  GetItRegisterSingleton.instance.init();


  /*local storage implementation*/
  SharedPreferencesDb.instance.init();



}
