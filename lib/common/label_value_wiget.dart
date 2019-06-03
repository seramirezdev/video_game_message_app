import 'package:flutter/material.dart';
import 'package:video_game_message_app/styles/text_styles.dart';

class LabelValueWidget extends StatelessWidget {
  final String label, value;
  final bool isWhite;

  LabelValueWidget({this.label, this.value, this.isWhite = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(value, style: isWhite ? whiteValueTextStyle : valueTextStyle),
        Text(label, style: isWhite ? whiteLabelTextStyle : labelTextStyle)
      ],
    );
  }
}
