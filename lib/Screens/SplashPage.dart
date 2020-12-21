import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bali_arcade/Screens/language_select.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);
  static String id = 'Splash';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();   
    Timer(
        Duration(seconds: 8),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LanguageSelect())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage("animation/BALI.gif"),
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}


