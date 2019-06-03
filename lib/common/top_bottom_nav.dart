import 'package:flutter/material.dart';
import 'package:video_game_message_app/styles/colors.dart';
import 'package:video_game_message_app/styles/text_styles.dart';

class TopBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        getTopNav(),
        getBottomNav(context),
      ],
    );
  }

  Widget getTopNav() {
    Widget buttomApps = Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 20.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Material(
          elevation: 10.0,
          shape: CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.apps,
              color: primaryColor,
            ),
          ),
        ),
      ),
    );

    Widget headingSubheadingWidget = Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Forum", style: headingStyle),
            Text("Kick of the conversation", style: subHeadingStyle),
          ],
        ),
      ),
    );

    return Container(
      height: 140.0,
      child: Column(
        children: <Widget>[
          buttomApps,
          headingSubheadingWidget,
        ],
      ),
    );
  }

  Widget getBottomNav(context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 90.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0))
        ),
        child: Text(
          "New Topic",
          style: buttonStyle,
        ),
      ),
    );
  }
}
