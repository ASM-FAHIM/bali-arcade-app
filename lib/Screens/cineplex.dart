import 'package:flutter/material.dart';

class CinePlex extends StatefulWidget {
  CinePlex({Key key}) : super(key: key);
  static String id = "cinePlex";
  @override
  _CinePlexState createState() => _CinePlexState();
}

class _CinePlexState extends State<CinePlex> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Color(0xff686968),
          title: Text(
            'Movies',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: Container(
          color: Colors.black,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Image(
                  height: 210,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  image: AssetImage('images/cinema.jpg'),
                ),
                Container(
                    height: 230,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xff686968),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(25))),
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: ListTile(
                            title: Text(
                              'Cinema',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            trailing: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                          ),
                          child: ListTile(
                            title: Text(
                              'Hall Type',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            trailing: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: ListTile(
                            title: Text(
                              'Date',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            trailing: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: ListTile(
                            title: Text(
                              'Time',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            trailing: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        )
                      ],
                    )),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Color(0xff686968),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(25))),
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 55),
                            child: ListTile(
                              leading: Icon(
                                Icons.minimize,
                                color: Colors.white,
                                size: 24,
                              ),
                              title: Text(
                                'Adult',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              trailing: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 55),
                            child: ListTile(
                              leading: Icon(
                                Icons.minimize,
                                color: Colors.white,
                                size: 24,
                              ),
                              title: Text(
                                'Children',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              trailing: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Color(0xff660066),
                      radius: 25,
                      child: Image(
                        height: 20,
                        image: AssetImage('images/icon_seat.png'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
