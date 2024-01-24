import 'package:flutter/material.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/utility/utility/utility.dart';

class NetworkErrorScreen extends StatelessWidget {
  const NetworkErrorScreen({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ImageShower(
          imgType: ImgType.local,
            imageUrl: networkErrorImage,
            height: getScreenHeight(kLayoutHeight / 2)),
        const SizedBox(height: 30),
        Text(error, style: gQuan()),
      ]),
    );
  }
}
