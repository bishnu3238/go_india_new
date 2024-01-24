import 'package:go_router/go_router.dart';

abstract class HomeEvent{}

class ChangeNavBar extends HomeEvent{
  int index;
   ChangeNavBar(this.index);
}class ChangeOnlineStatus extends HomeEvent{
  bool  value;
  ChangeOnlineStatus(this.value);
}