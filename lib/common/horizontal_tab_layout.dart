import 'package:flutter/material.dart';
import 'package:video_game_message_app/common/forum_card.dart';
import 'package:video_game_message_app/common/tab_text.dart';
import 'package:video_game_message_app/models/forum.dart';

class HorizontalTabLayout extends StatefulWidget {
  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout>
    with SingleTickerProviderStateMixin {
  int selectedTabIndex = 2;

  AnimationController _controller;
  Animation<Offset> _animation;
  Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(-0.05, 0))
        .animate(_controller);
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double heightCard = 350.0;

    return Container(
      child: Row(
        children: <Widget>[
          Expanded(flex: 4, child: getTabMenu(heightCard)),
          Expanded(
            flex: 20,
            child: Container(
              width: double.infinity,
              child: FutureBuilder(
                future: playAnimation(),
                builder: (context, snapshot) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _animation,
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: PageView.builder(
                          controller: PageController(viewportFraction: 0.8),
                          itemCount: getList(selectedTabIndex).length,
                          itemBuilder: (context, int currentIdx) {
                            return getList(selectedTabIndex)[currentIdx];
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getTabMenu(height) {
    return Container(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TabText(
            text: "Media",
            isSelected: selectedTabIndex == 0,
            onTabTap: () {
              onTabTap(0);
            },
          ),
          TabText(
            text: "Streamers",
            isSelected: selectedTabIndex == 1,
            onTabTap: () {
              onTabTap(1);
            },
          ),
          TabText(
            text: "Forum",
            isSelected: selectedTabIndex == 2,
            onTabTap: () {
              onTabTap(2);
            },
          ),
        ],
      ),
    );
  }

  List<Widget> getList(index) {
    return [
      [
        ForumCard(forum: fortniteForum),
        ForumCard(forum: pubgForum),
      ],
      [
        ForumCard(forum: pubgForum),
        ForumCard(forum: fortniteForum),
      ],
      [
        ForumCard(forum: fortniteForum),
        ForumCard(forum: pubgForum),
      ]
    ][index];
  }

  onTabTap(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
