import 'package:flutter/material.dart';
import 'package:video_game_message_app/styles/colors.dart';

class AppBackground extends StatelessWidget {
  Color firstColor, secondColor, thirdColor;

  AppBackground()
      : firstColor = firstCircleColor,
        secondColor = secondCircleColor,
        thirdColor = thirdCircleColor;

  AppBackground.withColors(
      Color first, Color second, Color third)
      : assert(first != null),
        assert(second != null),
        assert(third != null),
        firstColor = first,
        secondColor = second,
        thirdColor = third;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final height = constraint.maxHeight;
        final width = constraint.maxWidth;

        return Stack(
          children: <Widget>[
            Container(
              color: backgroundColor,
            ),
            Positioned(
              left: -(height / 2 - width / 2),
              bottom: height * 0.25,
              child: Container(
                height: height,
                width: height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: firstColor,
                ),
              ),
            ),
            Positioned(
              left: width * 0.15,
              top: -width * 0.6,
              child: Container(
                height: width * 1.5,
                width: width * 1.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondColor,
                ),
              ),
            ),
            Positioned(
              right: -width * 0.2,
              top: -width * 0.20,
              child: Container(
                height: width / 2,
                width: width / 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: thirdColor,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
