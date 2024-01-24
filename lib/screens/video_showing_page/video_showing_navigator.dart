import 'package:go_india/screens/profile_settings/export.dart';
import 'package:go_router/go_router.dart';
import '../../../../routes/route_path.dart';
import 'export.dart';

class VideoShowingRoute {
  static GoRoute subPage() => GoRoute(
        path: Screen.videoShowing.subPath,
        name: Screen.videoShowing.subCName,
        builder: (ctx, state) => const VideoShowingPage(),
      );
}
