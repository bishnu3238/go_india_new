import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'export.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';

class WaitForVerification extends StatelessWidget {
  const WaitForVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => WaitForVerificationCubit(
        get(),
        get(),
        get(),
        get(),
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: _simpleAppBar(context),
            body: const WaitForVerificationBody(),

          );
        },
      ),
    );
  }
}

SimpleAppBar _simpleAppBar(BuildContext context) {
  var theme = Theme.of(context);
  var driver = context.read<WaitForVerificationCubit>().state.driver;
  return SimpleAppBar(
    centerTitle: false,
    label: 'Welcome, ${driver.name}',
    bgColor: theme.colorScheme.background,
    style: gideonRoman(color: theme.colorScheme.shadow, weight: fw7),
    buttons: [
      FavIcon(
        icon: Icons.more_vert,
        iconColor: theme.colorScheme.onSecondary,
        onTap: () async => await popUp(context, [
          profileMenu,
          logoutMenu,
        ]),
      ),
    ],
  );
}
