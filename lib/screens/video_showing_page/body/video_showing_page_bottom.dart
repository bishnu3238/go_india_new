import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_india/domain/entity/entity.dart';
import 'package:go_india/package/package/package.dart';
import 'package:quiz_app/main.dart';

import '../../../../../routes/route_path.dart';
import '../../../../../utility/utility/utility.dart';
import '../export.dart';

class VideoShowingButton extends StatelessWidget {
  const VideoShowingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoShowingBloc, VideoShowingState>(
      builder: (context, state) {
        var cubit = context.watch<VideoShowingBloc>();
        return Wrap(
          children: [
            ElButton(
              text: 'Next',
              style: gideonRoman(color: kGolden, weight: fw9),
              onTap: cubit.state is VideoPlayState
                  ? () => Screen.quiz.go(
                        context,
                        // extra: cubit.masterRepository.quiz,
                      )
                  : null,
            ),
          ],
        );
      },
    );
  }
}
