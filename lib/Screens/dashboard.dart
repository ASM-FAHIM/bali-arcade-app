import 'package:bali_arcade/Screens/AmusementScreen.dart';
import 'package:bali_arcade/Screens/BaliArcade.dart';
import 'package:bali_arcade/Screens/Parking.dart';
import 'package:bali_arcade/Screens/cart_screen.dart';
import 'package:bali_arcade/Screens/cineplex.dart';
import 'package:bali_arcade/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AllCategory.dart';
import 'dart:async';
//import 'package:google_sign_in/google_sign_in.dart';

//AllCategory for Shop and Food Link
final String allCat1 =
    'http://baliarcade.work/api/baliarcade/all/shop/category';
final String allCat2 =
    'http://baliarcade.work/api/baliarcade/all/restaurant';
final String allCatShop = 'images/shop_bg.jpg';
final String allCatFood = 'images/foodFloor.jpg';

var scaffoldKey = GlobalKey<ScaffoldState>();
var lan;

class DashBoard extends StatefulWidget {
  DashBoard({Key key}) : super(key: key);
  static String id = 'DashBoardScreen';

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool isPressed1 = true;
  bool isPressed2 = true;
  List<bool> isBottmPressed = [false, false, false, false, false];
  List<bool> isCardPressed = [false, false, false, false, false, false];

  Future<void> getLan() async {
    //get the save lan usign Sharedpreferrences
    SharedPreferences language = await SharedPreferences.getInstance();
    setState(() {
      lan = language.getBool('lan');
    });
  }

  // //Google SignIn Authentication
  // GoogleSignIn _googleSignIn = new GoogleSignIn(scopes: ['email']);
  // _logout() async {
  //   await _googleSignIn.signOut();
  //   print(_googleSignIn);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getLan();
  }

  @override
  Widget build(BuildContext context) {
    return lan == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomPadding: false,
            endDrawer: Drawer(
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 0.9],
                        colors: [Colors.grey[700], Colors.white],
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              height: 60,
                              width: 250,
                            ),
                            CustomDrawerCloseButton(),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 110,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              lan ? 'Lorem Ipsum' : 'লরেম ইপ্সাম',
                              style: TextStyle(
                                  color: Color(0xff0886a3),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 472,
                    color: Colors.black,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            trailing: Icon(
                              Icons.account_box,
                              color: Colors.white,
                              size: 30,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 170),
                              child: Text(
                                lan ? '  Profile' : 'প্রোফাইল',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ),
                          ListTile(
                            trailing: Icon(
                              Icons.perm_device_information,
                              color: Colors.white,
                              size: 30,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 120),
                              child: Text(
                                lan ? '      Personal Info' : ' পারসোনাল ইনফো',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ),
                          ListTile(
                            trailing: Icon(
                              Icons.card_membership,
                              color: Colors.white,
                              size: 30,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 145),
                              child: Text(
                                lan ? 'Membership' : '     মেম্বারশিপ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                          ListTile(
                            trailing: Icon(
                              Icons.payment,
                              color: Colors.white,
                              size: 30,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 112),
                              child: Text(
                                lan
                                    ? 'Payments History'
                                    : '        পেইমেণ্ট হিস্ট্রি',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                          ListTile(
                            trailing: Icon(
                              Icons.account_balance_wallet,
                              color: Colors.white,
                              size: 30,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 175),
                              child: Text(
                                lan ? ' Wallet' : 'ওয়াল্লেট',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              // _logout();
                            },
                            trailing: Image.asset(
                              'images/icon_coins.png',
                              color: Colors.white,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 175),
                              child: Text(
                                lan ? ' Points' : 'পয়েন্টস',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              logoutMethods();
                            },
                            trailing: Image.asset(
                              'images/icon_logout.png',
                              color: Colors.white,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 165),
                              child: Text(
                                lan ? '  Logout' : 'লগআউট',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: Container(
              //height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.dstATop),
                image: AssetImage("images/home_screen.jpg"),
                fit: BoxFit.fill,
              )),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                    child: TopAppBar(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  Text(
                    lan ? 'Welcome to Bali Arcade' : 'বালি আরকেড এ স্বাগতম',
                    style: TextStyle(
                        color: Color(0xFF660066),
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    lan
                        ? 'Lorem ipsum dolor sit amet\nconseteture sadipsinc elitir,sed'
                        : 'বালি আরকেড এপ ইয়উস করুন,\n আর সময় এবং টাকা দুটিয় বাঁচান',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 110,
                        height: 90,
                        child: RaisedButton(
                          elevation: 16,
                          splashColor: Color(0xFF660066),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide.none),
                          onPressed: () {
                            setState(() {
                              isPressed2 = null;
                              isCardPressed = [
                                true,
                                false,
                                false,
                                false,
                                false,
                                false
                              ];
                            });
                            Navigator.pushNamed(context, Parking.id);
                          },
                          color: isCardPressed[0]
                              ? Color(0xFF660066)
                              : Colors.grey[800],
                          textColor: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 8, right: 12, left: 12),
                                child: SizedBox(
                                    height: 40,
                                    width: 50,
                                    child: Image.asset(
                                      'images/icon_cartab.png',
                                      color: Colors.white,
                                    )),
                              ),
                              Text(
                                lan ? 'Car Parking' : 'কার পারকিং',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 110,
                        height: 90,
                        child: RaisedButton(
                          elevation: 16,
                          splashColor: Color(0xFF660066),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide.none),
                          onPressed: () {
                            setState(() {
                              isPressed2 = null;
                              isCardPressed = [
                                false,
                                true,
                                false,
                                false,
                                false,
                                false
                              ];

                              Route route = MaterialPageRoute(
                                  builder: (context) => AllCategory(
                                      allCat1,
                                      1,
                                      allCatShop,
                                      lan
                                          ? "Floor Category"
                                          : "ফ্লোর কেটাগর‍ি"));
                              Navigator.push(context, route);
                              // Navigator.pushNamed(context, AllCategory.id);
                            });
                          },
                          color: isCardPressed[1]
                              ? Color(0xFF660066)
                              : Colors.grey[800],
                          textColor: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 8, right: 12, left: 12),
                                child: SizedBox(
                                    height: 40,
                                    width: 50,
                                    child: Image.asset(
                                      'images/icon_shoptab.png',
                                      color: Colors.white,
                                    )),
                              ),
                              Text(
                                lan ? 'Shop' : 'শপ',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 110,
                        height: 90,
                        child: RaisedButton(
                          elevation: 16,
                          splashColor: Color(0xFF660066),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide.none),
                          onPressed: () {
                            setState(() {
                              isPressed2 = null;
                              isCardPressed = [
                                false,
                                false,
                                true,
                                false,
                                false,
                                false
                              ];
                              Route route = MaterialPageRoute(
                                builder: (context) => AllCategory(
                                    allCat2,
                                    2,
                                    allCatFood,
                                    lan ? "Shop Category" : "শপ কেটাগর‍ি"),
                              );
                              Navigator.push(context, route);
                              //Navigator.pushNamed(context, FoodCourtCategory.id);
                            });
                          },
                          color: isCardPressed[2]
                              ? Color(0xFF660066)
                              : Colors.grey[800],
                          textColor: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 8, right: 12, left: 12),
                                child: SizedBox(
                                    height: 40,
                                    width: 50,
                                    child: Image.asset(
                                      'images/icon_foodtab.png',
                                      color: Colors.white,
                                    )),
                              ),
                              Text(
                                lan ? 'Food Court' : 'ফুড কোর্ট',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 110,
                        height: 90,
                        child: RaisedButton(
                          elevation: 16,
                          splashColor: Color(0xFF660066),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide.none),
                          onPressed: () {
                            setState(() {
                              isPressed2 = null;
                              isCardPressed = [
                                false,
                                false,
                                false,
                                true,
                                false,
                                false
                              ];

                              Navigator.pushNamed(context, CinePlex.id);
                            });
                          },
                          color: isCardPressed[3]
                              ? Color(0xFF660066)
                              : Colors.grey[800],
                          textColor: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 8, right: 12, left: 12),
                                child: SizedBox(
                                    height: 40,
                                    width: 50,
                                    child: Image.asset(
                                      'images/icon_cinepaxtab.png',
                                      color: Colors.white,
                                    )),
                              ),
                              Text(
                                lan ? 'CinePlex' : 'ছিনেপ্লেক্স',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 110,
                        height: 90,
                        child: RaisedButton(
                          elevation: 16,
                          splashColor: Color(0xFF660066),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide.none),
                          onPressed: () {
                            setState(() {
                              isPressed2 = null;
                              isCardPressed = [
                                false,
                                false,
                                false,
                                false,
                                true,
                                false
                              ];
                              Navigator.pushNamed(context, AmusementScreen.id);
                            });
                          },
                          color: isCardPressed[4]
                              ? Color(0xFF660066)
                              : Colors.grey[800],
                          textColor: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 8, right: 12, left: 12),
                                child: SizedBox(
                                    height: 38,
                                    width: 50,
                                    child: Image.asset(
                                      'images/icon_amusementpark.png',
                                      color: Colors.white,
                                    )),
                              ),
                              Text(
                                lan
                                    ? 'Amusement\n       Park'
                                    : 'এমোউসমেন্ট \n      পার্ক',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 110,
                        height: 90,
                        child: RaisedButton(
                          elevation: 16,
                          splashColor: Color(0xFF680068),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide.none),
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BaliArcadePage(),
                              ));
                              isPressed2 = null;
                              isCardPressed = [
                                false,
                                false,
                                false,
                                false,
                                false,
                                true
                              ];
                            });
                          },
                          color: isPressed2 ?? isCardPressed[5]
                              ? Color(0xFF660066)
                              : Colors.grey[800],
                          textColor: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 2.0, bottom: 2, right: 2, left: 2),
                                child: SizedBox(
                                    height: 80,
                                    width: 100,
                                    child: Image.asset(
                                      'images/logo_white.png',
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),

                  //////Bottom app bar/////////
                  Container(
                    width: 320,
                    height: 70,
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CartScreen()));
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
          );
  }

  logoutMethods() async {
    SharedPreferences savedValue = await SharedPreferences.getInstance();
    savedValue.setString('emails', null);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext ctx) => LoginPage()));
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
            Image(
              height: 50,
              width: 60,
              image: AssetImage('images/logo_white.png'),
              color: Colors.white,
            ),
            SizedBox(
              width: 110,
            ),
            IconButton(
              icon: Icon(
                Icons.account_circle,
                size: 35,
                color: Colors.white,
              ),
              onPressed: () => null,
            ),
            SizedBox(
              width: 10,
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

class CustomDrawerCloseButton extends StatelessWidget {
  // const CustomDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.close,
        color: Colors.black,
        size: 40,
      ),
    );
  }
}
