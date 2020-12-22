import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:bali_arcade/packages/carousel.dart';

var lan;

class Entertainment extends StatefulWidget {
  Entertainment({Key key}) : super(key: key);

  @override
  _EntertainmentState createState() => _EntertainmentState();
}

class _EntertainmentState extends State<Entertainment> {
  getLan() async {
    //get the save pid usign Sharedpreferrences

    SharedPreferences pref = await SharedPreferences.getInstance();
    bool p = pref.getBool('lan');
    setState(() {
      lan = p;
    });
  }


  var temp;
  var description;
  var icon;
  int tempc;
  Position _position;
  StreamSubscription<Position> _streamSubscription;
  Address _address;
  


  Future getWeather() async{
    http.Response response = await http.get("http://api.openweathermap.org/data/2.5/weather?q=chittagong&appid=439bb37509a06e3bd6c1939e5451a879");
    var result  = jsonDecode(response.body);

    setState(() {
      this.temp = result['main']['temp'];
      tempc = ((temp-32)*5/9);
      this.description = result['weather'][0]['main'];
      this.icon = result['weather'][0]['icon'];
    });
  }

  
  @override
  void initState() {
    super.initState();
    getLan();
    this.getWeather();

    var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    _streamSubscription = Geolocator().getPositionStream(locationOptions).listen((Position position) {
      setState(() {
        print("Position");
        _position = position;

        final coordinates = new Coordinates(position.latitude, position.longitude);
        convertCoordinateToAddress(coordinates).then((value) => _address = value);
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return lan == null
        ? 
    Center(
      child: CircularProgressIndicator(),
    )
        : 
    Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.9],
            colors: [Colors.black87, Colors.black54],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding:
                  const EdgeInsets.only(top: 30.0, left: 5, right: 5),
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
                            lan ? 'BALI ARCADE ' : 'বালি আরকেড',
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
                            onTap: () =>
                                Navigator.of(context).pop(context),
                            child: Text(
                              lan ? 'Back' : 'ব্যাক',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          )
                        ]),
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 5),
                  child: Container(
                    color: Colors.white70,
                    width: 120,
                    height: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lan ? 'Weather' : 'আবহাওয়া',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 40,
                                ),

                                Text(description != null ? description.toString() : "Loading",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],

                            ),
                          ),),
                        Container(
                            color: Colors.red,
                            child: Container(
                              child: Text(tempc != null ? tempc.toString() + "\u00B0c" : "Loading",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            )
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(height: 30,),
                                Text("Location",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                
                                Text("Location lat: ${_position?.latitude??'-'},\n lon: ${_position?.longitude??'-'}",
                                  style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 1,
                                  color: Colors.white,
                                ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '${_address?.addressLine??'-'}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),),
                      ],
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                child: Carousel(
                  boxFit: BoxFit.fill,
                  images: [
                    AssetImage('images/news1.jpg'),
                    AssetImage('images/news2.jpg'),
                    AssetImage('images/news3.jpg'),
                    AssetImage('images/news4.jpg'),
                    AssetImage('images/news5.jpg'),
                    AssetImage('images/news6.jpg'),
                  ],
                  autoplay: true,
                  indicatorBgPadding: 1.0,
                  dotColor: Colors.blueGrey,
                  dotBgColor: Colors.transparent,
                  dotSize: 4.0,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset('images/image_Amusementpark_bg.png'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          lan ? 'Amusement Park' : 'এমোউসমেন্ট পার্ক',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset('images/language_select.jpg'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          lan
                              ? 'Day Mood of Bali Arcade'
                              : 'ডে মোড অফ বালি আরকেড',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset('images/shop_bg.jpg'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          lan ? 'Shopping Floor' : 'শপিং ফ্লোর',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
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

  void dispose(){
    super.dispose();
    _streamSubscription.cancel();
  }

  Future convertCoordinateToAddress(Coordinates coordinates) async {

    var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return address.first;

  }
  
}







