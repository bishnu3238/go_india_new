// ignore_for_file: depend_on_referenced_packages

import 'package:go_india/domain/entity/others/instruction_video.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

abstract class VideoShowingState {}

class VideoLoadingState extends VideoShowingState {}

class VideoFetchState extends VideoShowingState {}

class VideoFetchErrorState extends VideoShowingState {}

class VideoPlayState extends VideoShowingState {
  final VideoPlayerController videoPlayerController;
  final ChewieController chewieController;

  VideoPlayState(VideoPlayerController controller)
      : videoPlayerController = controller,
        chewieController = ChewieController(videoPlayerController: controller);

  dispose() {
    chewieController.dispose();
    videoPlayerController.dispose();
  }
}
