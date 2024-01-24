import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/domain/repository/master_repository.dart';
import '../../../../package/package/package.dart';
import '../../../../utility/utility/utility.dart';
import 'export.dart';

class VideoShowingPage extends StatelessWidget {
  const VideoShowingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: (_) => get<MasterRepository>(),
      child: BlocProvider(
        create: (context) => VideoShowingBloc(get()),
        child: Scaffold(
          appBar: _simpleAppBar(context),
          body: const VideoShowingBody(),
          persistentFooterButtons: const [VideoShowingButton()],
        ),
      ),
    );
  }
}

SimpleAppBar _simpleAppBar(BuildContext context) {
  var theme = Theme.of(context);
  return SimpleAppBar(
    elevation: 0,
    bgColor: Colors.transparent, //theme.colorScheme.background,
    style: gideonRoman(color: theme.colorScheme.shadow, weight: fw7),
  );
}
