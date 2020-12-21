import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'dart:math';

var scaffoldKey = GlobalKey<ScaffoldState>();

class Parking extends StatefulWidget {
  static String id = 'Parking';
  @override
  _ParkingState createState() => _ParkingState();
}

class _ParkingState extends State<Parking> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), BlendMode.dstATop),
              image: AssetImage("images/carparking2.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                  child: Container(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide.none),
                      color: Colors.grey[800],
                      elevation: 8,
                      onPressed: () {},
                      child: Container(
                        color: Colors.grey[800],
                        padding: EdgeInsets.all(5),
                        child: Row(children: [
                          Image(
                            height: 50,
                            width: 60,
                            image: AssetImage('images/logo_white.png'),
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Parking Lounge',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(context),
                            child: Text(
                              'Back',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          )
                        ]),
                      ),
                    ),
                  )),
              Text(
                "LOREM IPSUM",
                style: TextStyle(
                  shadows: [
                    Shadow(
                      blurRadius: 30.0,
                      color: Colors.white,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF680068),
                ),
              ),
              Text(
                "Lorem ipsum dolor sit amet",
                style: TextStyle(
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: CustomPaint(
                  foregroundPainter: CircleProgress(70),
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Text("70%"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Occupied\n70%",
                    style: TextStyle(shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.white,
                        offset: Offset(5.0, 5.0),
                      ),
                    ], color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Available\n30%",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Card(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 100,
                            width: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/carparking.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Card(
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Basement\nParking",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      CustomPaint(
                                        foregroundPainter: CircleProgress2(60),
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          child: Text("70%"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Available\n0000/0000",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Card(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 100,
                            width: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/carparking.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Card(
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Semi Basement\nParking",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      CustomPaint(
                                        foregroundPainter: CircleProgress2(60),
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          child: Text("70%"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Available\n0000/0000",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopAppBar extends StatelessWidget {
  const TopAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), side: BorderSide.none),
        color: Colors.grey[800],
        elevation: 8,
        onPressed: () {},
        child: Container(
          color: Colors.grey[800],
          padding: EdgeInsets.all(5),
          child: Row(children: [
            Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: 180,
              height: 30,
              child: TextField(
                style: TextStyle(color: Colors.white54),
                cursorColor: Colors.white,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Search  for Category',
                  hintStyle: TextStyle(color: Colors.white54, fontSize: 16),
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            IconButton(
              icon: Icon(
                Icons.menu,
                size: 35,
                color: Colors.white,
              ),
              onPressed: () {
                scaffoldKey.currentState.openEndDrawer();
              },
            ),
          ]),
        ),
      ),
    );
  }
}

class CircleProgress extends CustomPainter {
  double currentProgrss;
  CircleProgress(this.currentProgrss);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint outerCircle = Paint()
      ..strokeWidth = 20
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = 20
      ..color = Color(0xFF680068)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, outerCircle);

    double angle = 2 * pi * (currentProgrss / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class CircleProgress2 extends CustomPainter {
  double currentProgrss2;
  CircleProgress2(this.currentProgrss2);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint outerCircle = Paint()
      ..strokeWidth = 6
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = 6
      ..color = Color(0xFF680068)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 6;

    canvas.drawCircle(center, radius, outerCircle);

    double angle = 2 * pi * (currentProgrss2 / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
