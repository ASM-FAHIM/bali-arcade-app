// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:bali_arcade/packages/carousel.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// const String testDevice = 'Mobile_id';
//
// var lan;
//
// class Entertainment extends StatefulWidget {
//   Entertainment({Key key}) : super(key: key);
//
//   @override
//   _EntertainmentState createState() => _EntertainmentState();
// }
//
// class _EntertainmentState extends State<Entertainment> {
//  
//  
//  
//   getLan() async {
//     //get the save pid usign Sharedpreferrences
//
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     bool p = pref.getBool('lan');
//     setState(() {
//       lan = p;
//     });
//   }
//
//
//   var temp;
//   var description;
//   var icon;
//   int tempc;
//   Position _position;
//   StreamSubscription<Position> _streamSubscription;
//   Address _address;
//
//
//
//   Future getWeather() async{
//     http.Response response = await http.get("http://api.openweathermap.org/data/2.5/weather?q=chittagong&appid=439bb37509a06e3bd6c1939e5451a879");
//     var result  = jsonDecode(response.body);
//
//     setState(() {
//       this.temp = result['main']['temp'];
//       tempc = ((temp-32)*5/9);
//       this.description = result['weather'][0]['main'];
//       this.icon = result['weather'][0]['icon'];
//     });
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//     getLan();
//     this.getWeather();
//
//     var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
//     _streamSubscription = Geolocator().getPositionStream(locationOptions).listen((Position position) {
//       setState(() {
//         print("Position");
//         _position = position;
//
//         final coordinates = new Coordinates(position.latitude, position.longitude);
//         convertCoordinateToAddress(coordinates).then((value) => _address = value);
//       });
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//    
//    
//     return lan == null
//         ?
//     Center(
//       child: CircularProgressIndicator(),
//     )
//         :
//     Scaffold(
//       backgroundColor: Colors.grey[800],
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             stops: [0.3, 0.9],
//             colors: [Colors.black87, Colors.black54],
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                   padding:
//                   const EdgeInsets.only(top: 30.0, left: 5, right: 5),
//                   child: Container(
//                     child: RaisedButton(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                           side: BorderSide.none),
//                       color: Colors.grey[800],
//                       elevation: 8,
//                       onPressed: () {},
//                       child: Container(
//                         color: Colors.grey[800],
//                         padding: EdgeInsets.all(5),
//                         child: Row(children: [
//                           Image(
//                             height: 50,
//                             width: 60,
//                             image: AssetImage('images/logo_white.png'),
//                             color: Colors.white,
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Text(
//                             lan ? 'BALI ARCADE ' : 'বালি আরকেড',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontStyle: FontStyle.normal,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             width: 25,
//                           ),
//                           GestureDetector(
//                             onTap: () =>
//                                 Navigator.of(context).pop(context),
//                             child: Text(
//                               lan ? 'Back' : 'ব্যাক',
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 16),
//                             ),
//                           )
//                         ]),
//                       ),
//                     ),
//                   )),
//               Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Container(
//                     color: Colors.white70,
//                     width: 400,
//                     height: 120,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 5.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   lan ? 'Weather' : 'আবহাওয়া',
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 20),
//                                 ),
//                                 SizedBox(
//                                   height: 40,
//                                 ),
//
//                                 // Text(description != null ? description.toString() : "Loading",
//                                 //   style: TextStyle(
//                                 //     color: Colors.white,
//                                 //     fontSize: 20,
//                                 //   ),
//                                 // ),
//                                 Text(
//                                   lan ? 'Clear' : 'পরিষ্কার',
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 20),
//                                 ),
//                               ],
//
//                             ),
//                           ),),
//                         Container(
//                             color: Colors.red,
//                             child: Container(
//                               child:
//                               // Text(tempc != null ? tempc.toString() + "\u00B0c" : "Loading",
// //                               //   style: TextStyle(
// //                               //     color: Colors.white,
// //                               //     fontSize: 20,
// //                               //   ),
// //                               // ),
// //                               Text(
// //                                 lan ? '18\u00B0c' : '১৮\u00B0c',
// //                                 style: TextStyle(
// //                                     color: Colors.white, fontSize: 20),
// //                               ),
// //                             )
//                         ),
//                         Container(
//                           child: Padding(
//                             padding: const EdgeInsets.only(right: 5.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 SizedBox(height: 20,),
//                                 Text("Location",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//
//                                 Text("Location lat: ${_position?.latitude??'-'},\n lon: ${_position?.longitude??'-'}",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 5,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 1,
//                                   child: Text(
//                                     '${_address?.addressLine??'-'}',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 10,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),),
//                       ],
//                     ),
//                   )),
//               SizedBox(
//                 height: 10,
//               ),
//              
//               Divider(
//                 height: 20,
//                 color: Colors.blueGrey,
//                 thickness: 8,
//               ),
//              
//               Padding(
//                 padding: const EdgeInsets.only(left: 15.0),
//                 child: Container(
//                   height: 20,
//                   child: Text(lan ? 'News' : 'খবর',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//              
//               MyList(),
//
//               Divider(
//                 height: 20,
//                 color: Colors.blueGrey,
//                 thickness: 8,
//               ),
//              
//               SizedBox(
//                 height: 10.0,
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.only(left: 15.0),
//                 child: Container(
//                   height: 20,
//                   child: Text(lan ? 'Shopping News' : 'শপিং এর খবর',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//
//               Myshopping(),
//
//               Divider(
//                 height: 20,
//                 color: Colors.blueGrey,
//                 thickness: 8,
//               ),
//
//               SizedBox(
//                 height: 10.0,
//               ),
//
//               Container(
//                 color: Colors.white,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Column(
//                           children: [
//                             Text('NAMAZ TIMING', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.red[200],),),
//                             SizedBox(height: 10,),
//                             Image.asset('images/prayer.jpg',width: 110,),
//                           ],
//                         )
//                       ],
//                     ),
//                     // SizedBox(width: 12,),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text('Wed, 20 Jan 2021', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.red[200],),),
//                             SizedBox(height: 30,),
//                             Container(
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     child: Column(
//                                       children: [Text('Fajr'), Text('05:16 AM')],
//                                     ),
//                                   ),
//                                   SizedBox(width: 15,),
//                                   Container(
//                                     child: Column(
//                                       children: [Text('Sunrise'), Text('06:34 AM')],
//                                     ),
//                                   ),
//                                   SizedBox(width: 15,),
//                                   Container(child: Column(
//                                     children: [Text('Dhuhr'), Text('12:04 AM')],
//                                   ),
//                                   ),
//                                   SizedBox(width: 10,),
//                                 ],
//                               ),
//                             ),
//
//                             SizedBox(height: 10),
//                            
//                             Container(
//                               color: Colors.black,
//                               height: 5,
//                               width: 200,
//                             ),
//
//                             SizedBox(height: 10),
//                            
//                             Container(
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     child: Column(
//                                       children: [Text('Asr'), Text('03:57 PM')],
//                                     ),
//                                   ),
//                                   SizedBox(width: 15,),
//                                   Container(
//                                     child: Column(
//                                       children: [Text('Maghrib'), Text('05:33 PM')],
//                                     ),
//                                   ),
//                                   SizedBox(width: 15,),
//                                   Container(child: Column(
//                                     children: [Text('Isha'), Text('06:51 PM')],
//                                   ),
//                                   ),
//                                   SizedBox(width: 10,),
//                                 ],
//                               ),
//                             ),
//                            
//                            
//                           ],
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 20),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void dispose(){
//     super.dispose();
//     _streamSubscription.cancel();
//   }
//
//   Future convertCoordinateToAddress(Coordinates coordinates) async {
//
//     var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//     return address.first;
//
//   }
// }
//
//
// class MyList extends StatefulWidget {
//   @override
//   _MyListState createState() => _MyListState();
// }
//
// class _MyListState extends State<MyList> {
//
//   String news1 = 'https://www.kalerkantho.com/online/country-news/2021/01/20/996909';
//   String news2 = 'https://www.kalerkantho.com/online/world/2021/01/20/996872';
//   String news3 = 'https://www.kalerkantho.com/online/business/2021/01/20/996881';
//   String news4 = 'https://www.kalerkantho.com/online/sport/2021/01/20/996907';
//   String news5 = 'https://www.kalerkantho.com/online/national/2021/01/18/996188';
//   String news6 = 'https://www.kalerkantho.com/online/entertainment/2021/01/20/996899';
//
//
//   Future<void> launchinbrowser(String url) async {
//     if(await canLaunch(url)){
//       await launch(url, forceSafariVC: false, forceWebView: false);
//     }
//     else{
//       throw 'Could Not launch $url';
//     }
//   }
//  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       height: 250,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//          
//           GestureDetector(
//             onTap: (){
//               setState(() {
//                 launchinbrowser(news1);
//               });
//             },
//             child: Container(
//               height: 180,
//               width: 280,
//               child: Column(
//                 children: [
//                   Image(
//                     image: AssetImage('images/news1.jpg'),
//                   ),
//                   Text("হালুয়াঘাটে শত পরিবার পেল মাথা গোজার ঠাই",
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 22,
//                   ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           SizedBox(width: 10,),
//          
//           GestureDetector(
//             onTap: (){
//               setState(() {
//                 launchinbrowser(news2);
//               });
//             },
//             child: Container(
//               height: 180,
//               width: 280,
//               child: Column(
//                 children: [
//                   Image(
//                     image: AssetImage('images/news2.jpg'),
//                   ),
//                   Text("৪৬ তম প্রেসিডেন্ট হিসেবে আজ শপথ নিচ্ছেন বাইডেন",
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 22,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           SizedBox(width: 10,),
//
//           GestureDetector(
//             onTap: (){
//               setState(() {
//                 launchinbrowser(news3);
//               });
//             },
//             child: Container(
//               height: 180,
//               width: 280,
//               child: Column(
//                 children: [
//                   Image(
//                     image: AssetImage('images/news3.jpg'),
//                   ),
//                   Text("ুঁজিবাজারে লেনদেনে সূচক বাড়ছে",
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 22,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           SizedBox(width: 10,),
//
//           GestureDetector(
//             onTap: (){
//               setState(() {
//                 launchinbrowser(news4);
//               });
//             },
//             child: Container(
//               height: 180,
//               width: 280,
//               child: Column(
//                 children: [
//                   Image(
//                     image: AssetImage('images/news4.jpg'),
//                   ),
//                   Text("পুজিবাজারে লেনদেনে সূচক বাড়ছে", 
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 22,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           SizedBox(width: 10,),
//
//           GestureDetector(
//             onTap: (){
//               setState(() {
//                 launchinbrowser(news5);
//               });
//             },
//             child: Container(
//               height: 180,
//               width: 280,
//               child: Column(
//                 children: [
//                   Image(
//                     image: AssetImage('images/news5.jpg'),
//                   ),
//                   Text("সাকিবের রাজকীয় প্রত্যাবর্তন, বোলিংয়ে এসেই নিলেন ৩ উইকেট",
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 22,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           SizedBox(width: 10,),
//
//           GestureDetector(
//             onTap: (){
//               setState(() {
//                 launchinbrowser(news6);
//               });
//             },
//             child: Container(
//               height: 180,
//               width: 280,
//               child: Column(
//                 children: [
//                   Image(
//                     image: AssetImage('images/news6.jpg'),
//                   ),
//                   Text("শুরু হচ্ছে সিসিমপুরের নতুন মৌসুম",
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 22,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//          
//         ],
//       ),
//     );
//   }
// }
//
//
// class Myshopping extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       height: 250,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           MyshoppingView(
//             img_location: 'images/fashion1.jpg',
//             img_caption: 'দোকানে চলছে ৫০% ছাড়',
//           ),
//           MyshoppingView(
//             img_location: 'images/fashion2.jpg',
//             img_caption: 'দোকানে চলছে ৫০% ছাড়',
//           ),
//           MyshoppingView(
//             img_location: 'images/fshion3.jpg',
//             img_caption: 'দোকানে চলছে ৫০% ছাড়',
//           ),
//           MyshoppingView(
//             img_location: 'images/fshion4.jpg',
//             img_caption: 'দোকানে চলছে ৫০% ছাড়',
//           ),
//           MyshoppingView(
//             img_location: 'images/fashion5.jpg',
//             img_caption: 'দোকানে চলছে ৫০% ছাড়',
//           ),
//         ],
//       ),
//     );
//   }
// }
// class MyshoppingView extends StatelessWidget {
//
//   final String img_location;
//   final String img_caption;
//
//   MyshoppingView({this.img_caption, this.img_location});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       child: InkWell(
//         onTap: (){
//
//         },
//         child: ListTile(
//           title: Image.asset(img_location),
//           subtitle: Text(
//             img_caption,
//             style: TextStyle(
//               color: Colors.blue,
//               fontSize: 22,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

const String testDevice = 'Mobile_id';

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

  //new Module
  final List<List<String>> products = [
    ['images/watch.jpg', 'Hugo Boss Oxygen', '100 \$'],
    ['images/watch-2.jpg', 'Hugo Boss Signature', '120 \$'],
    ['images/watch-3.jpg', 'Casio G-Shock Premium', '80 \$'],
    ['images/f1.jpg', 'Hugo Boss Oxygen', '100 \$'],
    ['images/f2.jpg', 'Hugo Boss Oxygen', '100 \$'],
    ['images/f3.jpg', 'Hugo Boss Oxygen', '100 \$'],
    ['images/f4.jpg', 'Hugo Boss Oxygen', '100 \$'],
    ['images/f5.jpg', 'Hugo Boss Oxygen', '100 \$'],
    ['images/f6.jpg', 'Hugo Boss Oxygen', '100 \$'],
    ['images/f7.jpg', 'Hugo Boss Oxygen', '100 \$'],
  ];

  int currentIndex = 0;

  void _next() {
    setState(() {
      if (currentIndex < products.length - 1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _preve() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
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
      backgroundColor: Colors.grey[800],
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
                  const EdgeInsets.only(top: 30.0),
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
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onHorizontalDragEnd: (DragEndDetails details) {
                        if (details.velocity.pixelsPerSecond.dx > 0) {
                          _preve();
                        } else if (details.velocity.pixelsPerSecond.dx < 0) {
                          _next();
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 600,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(products[currentIndex][0]),
                                fit: BoxFit.fill)),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  colors: [
                                    Colors.grey[700].withOpacity(.9),
                                    Colors.black.withOpacity(.0),
                                  ])),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Celebrate DSF with',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '50K SKYWORDS MILES...',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '17 Jan - 30 Jan',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 300,
                                margin: EdgeInsets.only(bottom: 30),
                                child: Row(
                                  children: _buildIndicator(),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                width: 150,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0))
                                  ),
                                  color: Colors.transparent,
                                  onPressed: (){},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('View all offers', style: TextStyle(fontSize: 10,color: Colors.white),),
                                      Icon(Icons.arrow_forward, size: 20,color: Colors.white,)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Location lat: ${_position?.latitude??'-'},\n lon: ${_position?.longitude??'-'}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 5,
                            color: Colors.white,
                          ),
                        ),
                        Center(
                          child: Expanded(
                            flex: 1,
                            child: Text(
                              '${_address?.addressLine??'-'}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          lan ? '18\u00B0c' : '১৮\u00B0c',
                          style: TextStyle(
                              color: Colors.white, fontSize: 25
                          ),
                        ),
                        Text(
                          lan ? 'Clear' : 'পরিষ্কার',
                          style: TextStyle(
                              color: Colors.white, fontSize: 25
                          ),
                        ),
                      ],
                    ),

                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 140,top: 20,bottom: 20),
                child: Text('Trending News', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            height: 200,
                            width: 170,
                            child: Image.asset('images/watch-2.jpg'),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            height: 200,
                            width: 170,
                            child: Image.asset('images/watch-3.jpg'),
                          ),
                        ],
                      ),

                    ),
                    SizedBox(
                      height: 30,
                      width: 150,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0))
                        ),
                        color: Colors.blueGrey,
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('View all offers', style: TextStyle(fontSize: 10,color: Colors.white),),
                            Icon(Icons.arrow_forward, size: 20,color: Colors.white,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 140,top: 10,bottom: 10),
                child: Text('Prayer Time', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
              ),
              MyList1(),
              SizedBox(height: 20,),
              MyList2(),
            ],
          ),
        ),
      ),
    );
  }
  Widget _indicator(bool isActive) {
    return Expanded(
      child: Container(
        height: 3,
        margin: EdgeInsets.only(right: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isActive ? Colors.white : Colors.grey[800]),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < products.length; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
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
class MyList1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          MyListView(
            img_location: 'images/fajr.jpg',
            img_caption: 'Fajr',
          ),
          MyListView(
            img_location: 'images/dhuhur.jpg',
            img_caption: 'Dhuhur',
          ),
          MyListView(
            img_location: 'images/asr.jpg',
            img_caption: 'Asr',
          ),
          // MyListView(
          //   img_location: 'images/magrib.jpg',
          //   img_caption: 'Magrib',
          // ),
          // MyListView(
          //   img_location: 'images/isha.jpg',
          //   img_caption: 'Isha',
          // ),
        ],
      ),
    );
  }
}

class MyList2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // MyListView(
          //   img_location: 'images/fajr.jpg',
          //   img_caption: 'Fajr',
          // ),
          // MyListView(
          //   img_location: 'images/dhuhur.jpg',
          //   img_caption: 'Dhuhur',
          // ),
          // MyListView(
          //   img_location: 'images/asr.jpg',
          //   img_caption: 'Asr',
          // ),
          MyListView(
            img_location: 'images/magrib.jpg',
            img_caption: 'Magrib',
          ),
          MyListView(
            img_location: 'images/isha.jpg',
            img_caption: 'Isha',
          ),
        ],
      ),
    );
  }
}

class MyListView extends StatelessWidget {

  final String img_location;
  final String img_caption;

  MyListView({this.img_caption, this.img_location});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: 300,
      child: InkWell(
        onTap: (){},
        child: ListTile(
          title: Image.asset(img_location, fit: BoxFit.cover,),
          subtitle: Text(img_caption, style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}