import 'export.dart';

class HomeState {
  final int navbarIndex;
  final bool onlineStatus;
  final String? message;
  final String? errorMessage;
  final HomeInitialParams params;

  const HomeState(
      {required this.params,
      this.navbarIndex = 0,
      this.onlineStatus = false,
      this.message,
      this.errorMessage});

  HomeState copyWith({
    int? navbarIndex,
    bool? onlineStatus,
    String? message,
    String? errorMessage,
    HomeInitialParams? params,
  }) {
    return HomeState(
      navbarIndex: navbarIndex ?? this.navbarIndex,
      onlineStatus: onlineStatus ?? this.onlineStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      message: message ?? this.message,
      params: params ?? this.params,
    );
  }

  @override
  String toString() {
    return 'HomeState{navbarIndex: $navbarIndex, onlineStatus: $onlineStatus, message: $message, errorMessage: $errorMessage, params: $params}';
  }
}
