// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:go_india/domain/repository/master_repository.dart';
import 'package:go_india/package/common/common.dart';

import 'export.dart';
import 'package:video_player/video_player.dart';

class VideoShowingBloc extends Cubit<VideoShowingState> {
  VideoShowingBloc(this.masterRepository) : super(VideoLoadingState()) {
    getInitialTestDetails();
  }

  final MasterRepository masterRepository;

  Future getInitialTestDetails() async {
    await masterRepository.getInstructionVideo().then(
          (value) => value.fold(
            (l) => emit(VideoFetchErrorState()),
            (r) async {
              await initializeVideo(r.video).then(
                (value) => emit(VideoPlayState(value)),
              );
            },
          ),
        );
    // await masterRepository.getQuiz().then(
    //       (value) => value.fold(
    //         (l) => null,
    //         (r) => null,
    //       ),
    //     );
  }

  Future<VideoPlayerController> initializeVideo(String url) async {
    var videoPlayerController = VideoPlayerController.networkUrl(url.uri);
    await videoPlayerController.initialize();
    return videoPlayerController;
  }

  @override
  Future<void> close() {
    if (state is VideoPlayState) {
      (state as VideoPlayState).videoPlayerController.dispose();
    }
    return super.close();
  }
}
