import 'package:flutter/material.dart';
import 'package:video_game_message_app/common/forum_detail_widget.dart';
import 'package:video_game_message_app/common/forum_name_widget.dart';
import 'package:video_game_message_app/models/forum.dart';
import 'package:video_game_message_app/pages/details_page.dart';

class ForumCard extends StatelessWidget {
  final Forum forum;

  ForumCard({this.forum});

  @override
  Widget build(BuildContext context) {
    double heightCard = 350.0;
    return Center(
      child: Container(
        height: heightCard,
        padding: EdgeInsets.only(right: 30.0),
        child: Material(
          elevation: 20.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(forum: forum)));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: forum.title,
                    child: Image.asset(
                      forum.imagePath,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: ForumDetailWidget(
                      forum: forum,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 70,
                    child: ForumNameWidget(
                      forum: forum,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
