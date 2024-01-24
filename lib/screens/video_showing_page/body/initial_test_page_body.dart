import 'dart:ui';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/screens/error_pages/network_error.dart';
import 'package:go_india/utility/utility/utility.dart';
import 'package:go_router/go_router.dart';
import '../export.dart';

class VideoShowingBody extends StatefulWidget {
  const VideoShowingBody({super.key});
  @override
  State<VideoShowingBody> createState() => _VideoShowingBodyState();
}

class _VideoShowingBodyState extends State<VideoShowingBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<VideoShowingBloc, VideoShowingState>(
        builder: (context, state) {
          var bloc = context.read<VideoShowingBloc>();
          if(state is VideoFetchErrorState) return const NetworkErrorScreen(error: 'SERVER DOWN');
          if (state is VideoFetchState) return const InitialTestFetching();

          if (state is VideoPlayState) {
            return VPlay(bloc: bloc, state: state);
          }

          return const Center(child: LoadingSpinner(color: kDBlue));
        },
      ),
    );
  }
}
