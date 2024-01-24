import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../package/package/package.dart';
import 'export.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Notifier notifier;
  HomeBloc({
    required HomeInitialParams? params,
    required this.notifier,
  }) : super(HomeState(params: params!)) {
    on<ChangeOnlineStatus>(_onChangeOnlineStatus);
    on<ChangeNavBar>(_onChangeNavBar);
  }

  FutureOr<void> _onChangeOnlineStatus(
      ChangeOnlineStatus event, Emitter<HomeState> emit) {
    emit(state.copyWith(onlineStatus: event.value));
  }

  FutureOr<void> _onChangeNavBar(ChangeNavBar event, Emitter<HomeState> emit) {
    event.index.log();

    try {
      state.params.navigationShell?.goBranch(event.index,
          initialLocation:
              event.index == state.params.navigationShell!.currentIndex);
      'hello joy bhakat'.log();
    } catch (e) {
      e.log();
    }
    emit(state.copyWith(navbarIndex: event.index));
  }
}
