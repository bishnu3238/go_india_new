import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_india/screens/home/export.dart';

import '../../../package/package/package.dart';
import '../../../utility/utility/utility.dart';


SimpleAppBar simpleAppBar(key, bloc) => SimpleAppBar(
      label: 'Home',
      leading: FavIcon(
        icon: FontAwesomeIcons.bars,
        onTap: () => key.currentState!.openDrawer(),
      ),
      onLeadingTap: () => key.currentState!.openDrawer(),
      buttons: [
        Row(
          children: [
            BlocConsumer<HomeBloc, HomeState>(
              bloc: bloc,
              listenWhen: (state, nextState) {
                if (state.onlineStatus == nextState.onlineStatus) return false;
                return true;
              },
              listener: (context, state) {
                state.onlineStatus
                    ? get<HomeBloc>().notifier.successMessage(
                        context: context,
                        message: state.message ?? 'Your are online now')
                    : get<HomeBloc>().notifier.errorMessage(
                        context: context,
                        message: state.message ?? 'Your are offline ');
              },
              builder: (context, state) {
                // var bloc = context.read<HomeBloc>();
                return Switch(
                    value: state.onlineStatus,
                    onChanged: (value) => bloc.add(ChangeOnlineStatus(value)));
              },
            ),
          ],
        )
      ],
    );
