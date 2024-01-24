import 'package:flutter/material.dart';
import 'package:go_india_rider/package/custom_indicator/circle.dart';
import 'package:go_india_rider/package/custom_indicator/ink_drop.dart';

class LoadingSpinner extends StatelessWidget {
  final Color? color;
  final double size;
  const LoadingSpinner({Key? key, this.color, this.size = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? Theme.of(context).colorScheme.onPrimary;
    return Center(
      child: inkDrop(color, size),
    );
  }
}

Widget circle(Color color, double size) =>
    SpinKitCircle(color: color, size: size);
Widget inkDrop(Color color, double size) => InkDrop(color: color, size: size);
