import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../utility/utility/utility.dart';
import '../../../routes/route_path.dart';
import '../../../package/package/package.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../export.dart';

class WaitForVerificationBody extends StatefulWidget {
  const WaitForVerificationBody({super.key});

  @override
  State<WaitForVerificationBody> createState() =>
      _WaitForVerificationBodyState();
}

class _WaitForVerificationBodyState extends State<WaitForVerificationBody> {
  bool isCircular = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets10,
      child: BlocBuilder<WaitForVerificationCubit, WaitForVerificationState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              AutoSizeText('Hello \n${state.driver.name}',
                  textAlign: TextAlign.start,
                  style: inter(size: getScreenWidth(kLayoutWidth * 1 / 8))),
              const SizedBox(height: 30),
              AutoSizeText(
                'Thank you for your interest. \nWe will review your information and get back to you shortly',
                style: inter(size: getScreenWidth(kLayoutWidth * 1 / 20)),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 50),
              const Spacer(),
              AnimatedContainer(
                width: isCircular ? 56.0 : 400.0,
                height: isCircular ? 56.0 : 50.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: FloatingActionButton(
                  onPressed: () {
                    context.read<WaitForVerificationCubit>().check(context);
                    setState(() {
                      isCircular = !isCircular;
                    });
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: isCircular
                        ? Icon(Icons.check, key: UniqueKey())
                        : Transform.rotate(
                            angle: isCircular ? 0 : 3.1415926,
                            child: Icon(Icons.rotate_left, key: UniqueKey()),
                          ),
                  ),
                ),
              ),
              ElButton(
                onTap: () => Screen.videoShowing.go(context),
                text: "Next",
              ),
            ],
          );
        },
      ),
    );
  }
}
