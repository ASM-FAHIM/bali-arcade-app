import 'dart:async';
import 'package:bali_arcade/Screens/ProductList.dart';
import 'package:flutter/material.dart';
import 'package:bali_arcade/api/ApiProductCategoryShop.dart';
import 'package:bali_arcade/pojo/ResponseShopPC.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bali_arcade/pojo/DataPc.dart';

List storedata = [];
List filterdata = [];
var pcid;
bool lan;
var l;

class ProductCategory extends StatefulWidget {
  static String id = 'productCategory';
  String name;
  ProductCategory(this.name);

  @override
  _ProductCategoryState createState() => _ProductCategoryState(this.name);
}

class _ProductCategoryState extends State<ProductCategory> {
  String name;
  _ProductCategoryState(this.name);

  bool isPressed1 = true;
  bool isPressed2 = true;
  List<bool> isBottmPressed = [false, false, false, false, false];
  var isLoading = false;
  ApiProductCategoryShop _apiProductCategoryShop = new ApiProductCategoryShop();
  String searchString = "";
  List data;

  Future<bool> getFoodData() async {
    //get the save pcid usign Sharedpreferrences
    SharedPreferences pref = await SharedPreferences.getInstance();
    var p = pref.getString('pcid');
    bool p2 = pref.getBool('lan');
    setState(() {
      pcid = p;
      lan = p2;
    });
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
            resizeToAvoidBottomInset: false,
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.dstATop),
                image: AssetImage("images/shop_bg.jpg"),
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
                                Container(
                                  width: 180,
                                  height: 30,
                                  child: TextField(
                                    onChanged: (value) {
                                      //  _filterCountries(value);
                                      setState(() {
                                        searchString = value;
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
                                  width: 14,
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
                                padding:
                                    const EdgeInsets.only(top: 12, left: 12),
                                child: lan
                                    ? Text('Category',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ))
                                    : Text('কেটাগরি',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        )),
                              )),
                          FutureBuilder<ResponseShopPC>(
                            future: _apiProductCategoryShop.getUser(pcid),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                filterdata = snapshot.data.data;
                                return Expanded(
                                  child: ListView.builder(
                                      itemCount: filterdata.length,
                                      itemBuilder: (context, index) {
                                        data = filterdata;
                                        DataPc user2 = filterdata[index];

                                        return user2.nameEn
                                                .contains(searchString)
                                            ? Column(
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          savePcIdList(
                                                              user2.id);
                                                          l = user2.id;
                                                          Route route =
                                                              MaterialPageRoute(
                                                            builder: (context) =>
                                                                ProductList(),
                                                          );
                                                          Navigator.push(
                                                              context, route);
                                                        });
                                                      },
                                                      child: Container(
                                                          height: 50,
                                                          decoration: BoxDecoration(
                                                              color: l ==
                                                                      user2.id
                                                                  ? Color(
                                                                      0xff660066)
                                                                  : Colors
                                                                      .transparent,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              shape: BoxShape
                                                                  .rectangle),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
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
                                                                        user2
                                                                            .nameEn,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 20),
                                                                      )
                                                                    : Text(
                                                                        user2
                                                                            .nameBn,
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

  //save the pcId in sharedPreferences
  void savePcIdList(var pcidList) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('pcidList', pcidList.toString());
  }
}
