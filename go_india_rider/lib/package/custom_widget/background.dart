import 'package:flutter/material.dart';
import 'package:go_india_rider/package/custom_widget/custom_widgets.dart';
import '../../utility/utils.dart'as img;

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    this.width = 150,
    this.imgType = ImgType.local,
    this.topImage =img. topImage,
    this.bottomImage = img.bottomImage,
  }) : super(key: key);

  final String topImage, bottomImage;
  final ImgType imgType;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: ImageShower(
                imageUrl: topImage,
                width: width,
                imgType: imgType,
              ),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}