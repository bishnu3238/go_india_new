import 'package:go_india/screens/profile_settings/export.dart';
import 'package:go_india/screens/quiz/score_page.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/route_path.dart';
import '../quiz/export.dart';
import '../video_showing_page/video_showing_navigator.dart';
import 'export.dart';

class WaitForVerificationRoute {
  static GoRoute page() => GoRoute(
        path: Screen.waitForVerification.path,
        name: Screen.waitForVerification.cName,
        builder: (ctx, state) => const WaitForVerification(),
        routes: [
          UserProfileRoute.subPage(),
          VideoShowingRoute.subPage(),
          QuizScreenRoute.subPage(),
          ScoreScreenRoute.subPage(),
        ],
      );
}
