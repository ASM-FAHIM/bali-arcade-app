import 'package:bali_arcade/Screens/ShopCategory.dart';
import 'package:bali_arcade/Screens/foodCourt.dart';
import 'package:flutter/material.dart';
import 'package:bali_arcade/api/ApiServiceProvider.dart';
import 'package:bali_arcade/pojo/Data.dart';
import 'package:bali_arcade/pojo/ResponseShop.dart';
import 'package:shared_preferences/shared_preferences.dart';

List filterdata = [];
bool lan;
List filterFloor = [];

//This is ShopCategoryPage
class AllCategory extends StatefulWidget {
  static String id = 'ShopCategoryScreen';
  String route;
  int c;
  String allCatBg;
  String catName;
  AllCategory(this.route, this.c, this.allCatBg, this.catName);

  @override
  _AllCategoryState createState() =>
      _AllCategoryState(this.route, this.c, this.allCatBg, this.catName);
}

class _AllCategoryState extends State<AllCategory> {
  String route;
  int c;
  String allCatBg;
  String catName;
  _AllCategoryState(this.route, this.c, this.allCatBg, this.catName);
  String dropdownValue = 'All';
  bool isPressed1 = true;
  bool isPressed2 = true;
  List<bool> isBottmPressed = [false, false, false, false, false];
  List<bool> press;
  var l;

  ApiServiceProvider _apiServiceProvider = new ApiServiceProvider();
  String searchString = "";
  List data;

  Future<bool> getLan() async {
    //get the save pid usign Sharedpreferrences

    SharedPreferences pref = await SharedPreferences.getInstance();
    bool p = pref.getBool('lan');
    setState(() {
      lan = p;
    });
    // String url = 'http://baliarcade.ringersoft.com/api/baliarcade/all/floor';

    // var response = await http.get(url);
    // if (response.statusCode == 200) {
    //   if (mounted) {
    //     setState(() {
    //       filterFloor = json.decode(response.body.toString());
    //     });
    //   }
    // }
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
            resizeToAvoidBottomInset: false,
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.dstATop),
                image: AssetImage("$allCatBg"),
                fit: BoxFit.fill,
              )),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //TopAppBar
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 20, right: 20),
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
                                Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.symmetric(horizontal: 2),
                                //   child: Container(
                                //     height: 60,
                                //     width: 220,
                                //     child: Card(
                                //       color: Colors.grey[800],
                                //       child: Padding(
                                //         padding: const EdgeInsets.only(left: 0),
                                //         child: DropdownButton<String>(
                                //           dropdownColor: Colors.black,
                                //           value: dropdownValue,
                                //           icon: Padding(
                                //             padding: const EdgeInsets.only(
                                //                 left: 100),
                                //             child: Icon(
                                //               Icons.filter_list,
                                //               color: Colors.amber,
                                //               size: 35,
                                //             ),
                                //           ),
                                //           iconSize: 24,
                                //           elevation: 16,
                                //           underline: Padding(
                                //             padding: const EdgeInsets.only(
                                //                 right: 10),
                                //             child: Container(
                                //               height: 1,
                                //               color: Colors.white,
                                //             ),
                                //           ),
                                //           onChanged: (String newValue) {
                                //             setState(() {
                                //               dropdownValue = newValue;
                                //             });
                                //           },
                                //           items: <String>[
                                //             '1st Floor',
                                //             '2nd Floor',
                                //             '3rd Floor',
                                //             '4th Floor',
                                //             'All'
                                //           ].map<DropdownMenuItem<String>>(
                                //               (String value) {
                                //             return DropdownMenuItem<String>(
                                //               value: value,
                                //               child: Text(
                                //                 value,
                                //                 style: TextStyle(
                                //                     color: Colors.white),
                                //               ),
                                //             );
                                //           }).toList(),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Container(
                                  width: 180,
                                  height: 30,
                                  child: TextField(
                                    onChanged: (value) {
                                      //  _filterCountries(value);
                                      setState(() {
                                        searchString = value.toUpperCase();
                                      });
                                    },
                                    style: TextStyle(color: Colors.white),
                                    cursorColor: Colors.white,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: lan
                                          ? 'Search  for Category'
                                          : 'কাঙ্খিত পণ্যটি খুজুন',
                                      hintStyle: TextStyle(
                                          color: Colors.white54, fontSize: 16),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                IconButton(
                                  iconSize: 30,
                                  icon: lan
                                      ? Text(
                                          'Back',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      : Text(
                                          'ব্যাক',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ]),
                            ),
                          ),
                        )),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 20),
                    //       child: Container(
                    //         height: 60,
                    //         width: 320,
                    //         child: Card(
                    //           color: Colors.grey[800],
                    //           child: Padding(
                    //             padding: const EdgeInsets.only(left: 20),
                    //             child: DropdownButton<String>(
                    //               dropdownColor: Colors.black,
                    //               value: dropdownValue,
                    //               icon: Padding(
                    //                 padding: const EdgeInsets.only(left: 160),
                    //                 child: Icon(
                    //                   Icons.filter_list,
                    //                   color: Colors.amber,
                    //                   size: 35,
                    //                 ),
                    //               ),
                    //               iconSize: 24,
                    //               elevation: 16,
                    //               underline: Padding(
                    //                 padding: const EdgeInsets.only(right: 30),
                    //                 child: Container(
                    //                   height: 1,
                    //                   color: Colors.white,
                    //                 ),
                    //               ),
                    //               onChanged: (String newValue) {
                    //                 setState(() {
                    //                   dropdownValue = newValue;
                    //                 });
                    //               },
                    //               items: <String>[
                    //                 '1st Floor',
                    //                 '2nd Floor',
                    //                 '3rd Floor',
                    //                 '4th Floor'
                    //               ].map<DropdownMenuItem<String>>(
                    //                   (String value) {
                    //                 return DropdownMenuItem<String>(
                    //                   value: value,
                    //                   child: Text(
                    //                     value,
                    //                     style: TextStyle(color: Colors.white),
                    //                   ),
                    //                 );
                    //               }).toList(),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      width: 320,
                      height: MediaQuery.of(context).size.height / 1.22,
                      decoration: BoxDecoration(
                          color: Colors.grey[800].withAlpha(80),
                          borderRadius: BorderRadius.circular(10.0),
                          shape: BoxShape.rectangle),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, left: 12, bottom: 0),
                                  child: Text('$catName',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      )))),
                          FutureBuilder<ResponseShop>(
                            future: _apiServiceProvider.getUser(route, c),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                filterdata = snapshot.data.data;
                                return Expanded(
                                  child: ListView.builder(
                                      itemCount: filterdata.length,
                                      itemBuilder: (context, index) {
                                        data = filterdata;
                                        Data user = filterdata[index];
                                        return (user.nameEn
                                                    .contains(searchString) ||
                                                user.nameBn
                                                    .contains(searchString))
                                            ? Column(
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          saveId(user.id);
                                                          l = user.id;
                                                          Route route =
                                                              MaterialPageRoute(
                                                            builder: (context) => allCatBg ==
                                                                    'images/shop_bg.jpg'
                                                                ? ShopCategory(lan
                                                                    ? user
                                                                        .nameEn
                                                                    : user
                                                                        .nameBn)
                                                                : FoodCourt(),
                                                          );
                                                          Navigator.push(
                                                              context, route);
                                                        });
                                                      },
                                                      child: Container(
                                                          height: 75,
                                                          color: l == user.id
                                                              ? Color(
                                                                  0xff660066)
                                                              : Colors
                                                                  .transparent,
                                                          child: Row(
                                                            children: <Widget>[
                                                              Icon(
                                                                Icons.near_me,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child: lan
                                                                    ? Text(
                                                                        user.nameEn,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 18),
                                                                      )
                                                                    : Text(
                                                                        user.nameBn,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 20),
                                                                      ),
                                                              ),
                                                              Expanded(
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_right,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 40,
                                                                ),
                                                              ),
                                                              // Padding(
                                                              //   padding:
                                                              //       const EdgeInsets
                                                              //           .only(left: 10),
                                                              //   child: Container(
                                                              //     child:
                                                              //         CachedNetworkImage(
                                                              //       fit: BoxFit.fill,
                                                              //       imageUrl:
                                                              //           user.image,
                                                              //       placeholder: (context,
                                                              //               url) =>
                                                              //           LinearProgressIndicator(
                                                              //         minHeight: 1,
                                                              //       ),
                                                              //       errorWidget:
                                                              //           (context, url,
                                                              //                   error) =>
                                                              //               Icon(Icons
                                                              //                   .error),
                                                              //     ),
                                                              //     width: 60,
                                                              //     height: 60,
                                                              //   ),
                                                              // ),
                                                            ],
                                                          ))),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 6),
                                                    child: Divider(
                                                      color: Colors.white,
                                                      thickness: 1,
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Container();
                                      }),
                                );
                              } else {
                                return Center(
                                  child: LinearProgressIndicator(
                                    minHeight: 2,
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

//save the pId in sharedPreferences
  void saveId(var pid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('pid', pid.toString());
    print("This is All category Pid " + pid.toString());
  }
}
