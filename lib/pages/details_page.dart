import 'package:flutter/material.dart';
import 'package:video_game_message_app/common/app_background.dart';
import 'package:video_game_message_app/common/label_value_wiget.dart';
import 'package:video_game_message_app/models/forum.dart';
import 'package:video_game_message_app/models/topic.dart';
import 'package:video_game_message_app/styles/colors.dart';
import 'package:video_game_message_app/styles/text_styles.dart';

class DetailsPage extends StatefulWidget {
  final Forum forum;

  DetailsPage({this.forum});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _slideAnimation;
  Animation<double> _scaleAnimation;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _slideAnimation = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
        .animate(_controller);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _offsetAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(_controller);
  }

  _playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground.withColors(firstOrangeCircleColor,
              secondOrangeCircleColor, thirdOrangeCircleColor),
          getInfo(context),
          getTopics(),
          Positioned(
            // Circle rank info
            bottom: 170.0,
            right: 30.0,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Material(
                elevation: 10.0,
                shape: CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.forum.rank,
                    style: rankBigStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getInfo(context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          FutureBuilder(
            future: _playAnimation(),
            builder: (context, snapshot) {
              return SlideTransition(
                position: _slideAnimation,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 100.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      LabelValueWidget(
                        value: widget.forum.topics.length.toString(),
                        label: "topics",
                        isWhite: true,
                      ),
                      LabelValueWidget(
                        value: widget.forum.threads,
                        label: "threads",
                        isWhite: true,
                      ),
                      LabelValueWidget(
                        value: widget.forum.subs,
                        label: "subs",
                        isWhite: true,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0)),
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height - 200,
              width: double.infinity,
              child: Hero(
                tag: widget.forum.title,
                child: Image.asset(
                  widget.forum.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTopics() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0)),
        child: Container(
          height: 200,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Text("Topics", style: subHeadingStyle)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SlideTransition(
                      position: _offsetAnimation,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          getTopicTitle(widget.forum.topics[0]),
                          getTopicTitle(widget.forum.topics[1])
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getTopicTitle(Topic topic) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                topic.question,
                style: topicQuestionTextStyle,
              ),
              Container(
                width: 70.0,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: primaryColor),
                child: Text(
                  topic.answerCount,
                  style: topicAnswerCountTextStyle,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 65.0),
          child: Text(
            topic.recentAnswer,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: topicAnswerTextStyle,
          ),
        )
      ],
    );
  }
}
