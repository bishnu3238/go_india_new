import 'package:flutter/material.dart';
import '../../utility/utils.dart';
import '../custom_indicator/loading_spinner.dart';

class ElButton extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final Widget? title;
  final TextStyle? style;
  final bool showLoading;
  final EdgeInsets padding;
  final VoidCallback? press;
  const ElButton(
      {super.key,
      this.title,
      this.text = '',
      this.showLoading = false,
      this.padding = edgeInsets5,
      this.bgColor,
      this.style,
      this.press});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: padding,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: press,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            bgColor ?? theme.colorScheme.primary,
          ),
          shape: MaterialStatePropertyAll(roundBorder5),
          padding: const MaterialStatePropertyAll(edgeInsets0812),
        ),
        child: showLoading
            ? const LoadingSpinner(size: 20)
            : title ?? Text(text, style: style ?? gQuan()),
      ),
    );
  }
}
