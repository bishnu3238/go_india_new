import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../package/package/package.dart';
import '../../routes/route_path.dart';
import '../../utility/utility/utility.dart';
import 'export.dart';

class Home extends StatelessWidget {
  Home({super.key, required this.bloc, required this.shell});
  final HomeBloc bloc;
  final StatefulNavigationShell shell;

  // bool v = false;

  // HomeBloc get bloc => bloc;

  final keys = GlobalKey<ScaffoldState>(debugLabel: 'home');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        bloc: bloc,
        builder: (context, state) {
          'kolkata ${shell.currentIndex} lll ${state.params.navigationShell!.currentIndex}'
              .log();
          return Scaffold(
            key: keys,
            drawer: const AppDrawer(),
            appBar: simpleAppBar(keys, bloc),
            body: shell,
            // body: widgets[state.params.navigationShell!.currentIndex],
            // body: widgets[state.navbarIndex],
            bottomNavigationBar: HomeBottomNavigationBar(shell, bloc),
          );
        });
  }
}
