import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../export.dart';

class VPlay extends StatefulWidget {
  const VPlay({super.key, required this.bloc, required this.state});
  final VideoShowingBloc bloc;
  final VideoPlayState state;

  @override
  State<VPlay> createState() => _VPlayState();
}

class _VPlayState extends State<VPlay> {
  get bloc => widget.bloc;
  get state => widget.state;

  @override
  void dispose() {
    super.dispose();
    if (state is VideoPlayState) {
      (state as VideoPlayState).dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Chewie(
          controller: state.chewieController,
        ),
      ),
    );
  }
}
