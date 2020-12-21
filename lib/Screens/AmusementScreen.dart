import 'package:flutter/material.dart';

class AmusementScreen extends StatefulWidget {
  AmusementScreen({Key key}) : super(key: key);
  static String id = 'AmuseMent';
  @override
  _AmusementScreenState createState() => _AmusementScreenState();
}

class _AmusementScreenState extends State<AmusementScreen> {
  bool isPressed1 = true;
  bool isPressed2 = true;
  List<bool> isBottmPressed = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: AssetImage("images/image_Amusementpark_bg.png"),
            fit: BoxFit.fill,
          )),
          child: Column(
            children: <Widget>[
              Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                  child: Container(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide.none),
                      color: Colors.grey[800],
                      elevation: 8,
                      onPressed: () {},
                      child: Container(
                        width: double.infinity,
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
                                hintText: 'Search  Games',
                                hintStyle: TextStyle(
                                    color: Colors.white54, fontSize: 16),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 14,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Text(
                              'BACK',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          )
                        ]),
                      ),
                    ),
                  )),
              SizedBox(
                height: 5,
              ),
              Text('LOREM IPSUM',
                  style: TextStyle(
                      color: Color(0xff660066),
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Games',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                height: 430,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 110,
                              height: 130,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      image: AssetImage('images/amuse3.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                            Container(
                              width: 150,
                              height: 140,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Game 1:lorem ipsum',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'lorem ipsum',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 8),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Bali Arcade Mall',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: CircleAvatar(
                                        radius: 16,
                                        backgroundColor: Color(0xff660066),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.pin_drop,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 150,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Color(0xff660066),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    'B',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'U',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Y',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 110,
                              height: 130,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      image: AssetImage('images/amuse1.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                            Container(
                              width: 150,
                              height: 140,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Game 1:lorem ipsum',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'lorem ipsum',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 8),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Bali Arcade Mall',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: CircleAvatar(
                                        radius: 16,
                                        backgroundColor: Color(0xff660066),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.pin_drop,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 150,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Color(0xff660066),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    'B',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'U',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Y',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 110,
                              height: 130,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      image: AssetImage('images/amuse2.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                            Container(
                              width: 150,
                              height: 140,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Game 1:lorem ipsum',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'lorem ipsum',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 8),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Bali Arcade Mall',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: CircleAvatar(
                                        radius: 16,
                                        backgroundColor: Color(0xff660066),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.pin_drop,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 150,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Color(0xff660066),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    'B',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'U',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Y',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //BottomBar
              Container(
                width: 320,
                height: 65,
                child: RaisedButton(
                  elevation: 25,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide.none),
                  onPressed: () {},
                  color: Colors.grey[800],
                  textColor: Colors.white,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 3,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey[800],
                        child: IconButton(
                          icon: Icon(
                            Icons.directions_car,
                            size: 36,
                            color: isBottmPressed[0]
                                ? Color(0xFF680068)
                                : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isPressed1 = null;
                              isBottmPressed = [
                                true,
                                false,
                                false,
                                false,
                                false
                              ];
                              print('pressed');
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey[800],
                        child: IconButton(
                          icon: Icon(
                            Icons.restaurant,
                            size: 35,
                            color: isBottmPressed[1]
                                ? Color(0xFF680068)
                                : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isPressed1 = null;
                              isBottmPressed = [
                                false,
                                true,
                                false,
                                false,
                                false
                              ];
                              print('pressed2');
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey[800],
                        child: IconButton(
                          icon: Icon(
                            Icons.home,
                            size: 40,
                            color: isPressed1 ?? isBottmPressed[2]
                                ? Color(0xFF680068)
                                : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isPressed1 = null;
                              isBottmPressed = [
                                false,
                                false,
                                true,
                                false,
                                false
                              ];
                              print('pressed2');
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey[800],
                        child: IconButton(
                          icon: Icon(
                            Icons.calendar_today,
                            size: 35,
                            color: isBottmPressed[3]
                                ? Color(0xFF680068)
                                : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isPressed1 = null;
                              // isPressed2=true;
                              // isPressed1=false;
                              isBottmPressed = [
                                false,
                                false,
                                false,
                                true,
                                false
                              ];
                              print('pressed2');
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey[800],
                        child: IconButton(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            size: 35,
                            color: isBottmPressed[4]
                                ? Color(0xFF680068)
                                : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isPressed1 = null;
                              isBottmPressed = [
                                false,
                                false,
                                false,
                                false,
                                true
                              ];
                              print('pressed2');
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
