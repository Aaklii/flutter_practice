import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1050),
    );
    _animationController.forward();
    _animationController.reverse();
  }

  Container topicPage = Container(
    color: Colors.blueAccent,
    width: double.infinity,
  );

  Container conversationPage = Container(
    color: Colors.redAccent,
    width: double.infinity,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        setState(
          () {
            _animationController.forward();

          },
        );
      },
          onDoubleTap: () {
            setState(
                  () {
                    _animationController.reverse();
              },
            );
          },

      child: Stack(
        children: [
          topicPage,
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              double width = MediaQuery.of(context).size.width *
                  _animationController.value;
              print("Value: " + _animationController.value.toString());
              return Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()..translate(width),
                child: conversationPage,
              );
            },
          )
        ],
      ),
    ));
  }
}
