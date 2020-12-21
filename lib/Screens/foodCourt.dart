import 'package:bali_arcade/Screens/Description.dart';
import 'package:flutter/material.dart';
import 'package:bali_arcade/src/carousel_pro.dart';
import 'Description.dart';
import 'FoodMenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

var pid;
var lan;

class FoodCourt extends StatefulWidget {
  static String id = "foodCourt";

  @override
  _FoodCourtState createState() => _FoodCourtState();
}

class _FoodCourtState extends State<FoodCourt> {
  getLan() async {
    //get the save pid usign Sharedpreferrences
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool p2 = pref.getBool('lan');
    setState(() {
      lan = p2;
    });
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLan();
  }

  @override
  Widget build(BuildContext context) {
    return lan == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.black,
            body: Container(
              child: ListView(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: Carousel(
                        showIndicator: true,
                        indicatorBgPadding: 10,
                        overlayShadow: false,
                        dotSize: 4,
                        boxFit: BoxFit.cover,
                        images: [
                          ExactAssetImage("images/BestBurger.jpg"),
                          ExactAssetImage("images/pizza.jpg"),
                          ExactAssetImage("images/Burger2.jpg"),
                          ExactAssetImage("images/Burger.jpg"),
                          ExactAssetImage("images/food.png")
                        ],
                      )),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0001, 0.2],
                              colors: [Colors.grey[800], Colors.white24],
                            ),
                          ),
                          child: TabBar(
                              indicatorColor: Color(0xff660066),
                              indicatorWeight: 5,
                              tabs: [
                                Tab(text: lan ? "Menu" : 'মেনু'),
                                Tab(text: lan ? 'Details' : 'ডিটেইলস'),
                              ]),
                        ),
                        Container(
                          //Add this to give height
                          height: MediaQuery.of(context).size.height / 1.8,
                          child:
                              TabBarView(children: [FoodMenu(), Description()]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
