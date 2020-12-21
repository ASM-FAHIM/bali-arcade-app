import 'dart:async';
import 'package:bali_arcade/Screens/ProductCategory.dart';
import 'package:flutter/material.dart';
import 'package:bali_arcade/api/ApiServiceProvider2.dart';
import 'package:bali_arcade/pojo/ShopCategoryData.dart';
import 'package:bali_arcade/pojo/ResponseShopCategory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';

List storedata = [];
List filterdata = [];
List filterFloor = [];
var pid;
bool lan;
var _mySelection;

class ShopCategory extends StatefulWidget {
  static String id = 'arts_handi';
  String name;
  ShopCategory(this.name);

  @override
  _ShopCategoryState createState() => _ShopCategoryState(this.name);
}

class _ShopCategoryState extends State<ShopCategory> {
  String name;
  _ShopCategoryState(this.name);

  bool isPressed1 = true;
  bool isPressed2 = true;
  List<bool> isBottmPressed = [false, false, false, false, false];
  var isLoading = false;
  ApiServiceProvider2 _apiServiceProvider2 = new ApiServiceProvider2();
  String searchString = "";
  List data;

  Future<bool> getFoodData() async {
    //get the save pid usign Sharedpreferrences
    SharedPreferences pref = await SharedPreferences.getInstance();
    var p = pref.getString('pid');
    bool p2 = pref.getBool('lan');
    setState(() {
      pid = p;
      lan = p2;
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
    setState(() {
      isLoading = true;
    });
    getFoodData();
  }

  @override
  Widget build(BuildContext context) {
    return lan == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.9],
                  colors: [Colors.black54, Colors.grey],
                ),
              ),
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
                                  onChanged: (value) {
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
                                        color: Colors.white, fontSize: 16),
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
                              // DropdownButton(
                              //   icon: Icon(Icons.filter_list),
                              //   iconEnabledColor: Colors.white,
                              //   items: filterFloor.map((item) {
                              //     return new DropdownMenuItem(
                              //       child: new Text(item['name_en']),
                              //       value: item['id'].toString(),
                              //     );
                              //   }).toList(),
                              //   onChanged: (newVal) {
                              //     setState(() {
                              //       _mySelection = newVal;
                              //       print(_mySelection);
                              //     });
                              //   },
                              //   value: _mySelection,
                              // ),
                              IconButton(
                                iconSize: 30,
                                icon: Text(
                                  lan ? 'Back' : 'ব্যাক',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                              ),
                            ]),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '$name',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  FutureBuilder<ResponseShopCategory>(
                    future: _apiServiceProvider2.getUser(pid),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        filterdata = snapshot.data.data;
                        return Expanded(
                          child: ListView.builder(
                            itemCount: filterdata.length,
                            itemBuilder: (context, index) {
                              ShopCatData shop = filterdata[index];
                              return shop.nameEn.contains(searchString)
                                  ? Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                savePcId(shop.id);

                                                Route route = MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductCategory(lan
                                                          ? shop.nameEn
                                                          : shop.nameBn),
                                                );
                                                Navigator.push(context, route);
                                              });
                                            },
                                            child: Card(
                                              elevation: 2,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    4.2,
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                4))),
                                                child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    CachedNetworkImage(
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.black,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          4)),
                                                          image: DecorationImage(
                                                              image:
                                                                  imageProvider,
                                                              fit: BoxFit.cover,
                                                              colorFilter: ColorFilter.mode(
                                                                  Colors.black
                                                                      .withOpacity(
                                                                          0.8),
                                                                  BlendMode
                                                                      .dstATop)),
                                                        ),
                                                      ),
                                                      imageUrl: shop.image,
                                                      placeholder: (context,
                                                              url) =>
                                                          LinearProgressIndicator(
                                                        minHeight: 1,
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          lan
                                                              ? shop.nameEn
                                                              : shop.nameBn,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 2,
                                                        ),
                                                        Text(
                                                          lan
                                                              ? 'Phone Number  ${shop.phoneEn}'
                                                              : 'ফোন নাম্বার  ${shop.phoneBn} ',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14),
                                                        ),
                                                        SizedBox(
                                                          height: 2,
                                                        ),
                                                        Text(
                                                            lan
                                                                ? 'Bali Arcade Mall'
                                                                : 'বালি আরকেড মল',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container();
                            },
                          ),
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
          );
  }

  //save the pcId in sharedPreferences
  void savePcId(var pcid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('pcid', pcid.toString());
  }
}
