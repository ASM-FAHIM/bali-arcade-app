import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bali_arcade/Screens/language_select.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  static String id = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation animatation1, animation2;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LanguageSelect())));

    animationController =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    animatation1 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.4, curve: Curves.linear)));
    animation2 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.8, curve: Curves.linear)));
    animationController.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Transform(
            transform: Matrix4.identity()
              ..setEntry(2, 2, 0.9)
              ..rotateX(2 * 3.15167 * animation2.value)
              ..rotateY(2 * 3.15167 * animatation1.value),
            alignment: Alignment.center,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(58.0),
                child: Container(
                  child: Image.asset(
                    'images/logo_purple.png',
                    color: Color(0xff660066),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
