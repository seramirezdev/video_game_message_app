import 'package:flutter/material.dart';
import 'package:video_game_message_app/styles/text_styles.dart';

class TabText extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Function onTabTap;

  TabText({this.text, this.isSelected = false, this.onTabTap});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: InkWell(
        onTap: onTabTap,
        child: AnimatedDefaultTextStyle(
          style: isSelected ? selectedTabStyle : defaultTabStyle,
          duration: const Duration(milliseconds: 300),
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
