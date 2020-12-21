import 'package:bali_arcade/pojo/ResponseFoodMenu.dart';
import 'package:flutter/material.dart';
import 'package:bali_arcade/api/ApiFoodMenuResponse.dart';
import 'package:bali_arcade/pojo/DataFoodMenu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'FoodProductList.dart';

List filterdata = [];
var l;
var pid;

//store data from api for Description Page
String desEn;

class FoodMenu extends StatefulWidget {
  FoodMenu({Key key}) : super(key: key);
  static String id = "FoodMenu";
  @override
  _FoodMenuState createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  ApiFoodMenuResponse _apiFoodMenuResponse = new ApiFoodMenuResponse();

  Future<bool> getFoodData() async {
    //get the save pid usign Sharedpreferrences
    SharedPreferences pref = await SharedPreferences.getInstance();
    var p = pref.getString('pid');
    bool p2 = pref.getBool('lan');
    setState(() {
      pid = p;
      lan = p2;
    });
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFoodData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.5],
            colors: [Colors.grey, Colors.black54],
          ),
        ),
        child: FutureBuilder<ResponseFoodMenu>(
          future: _apiFoodMenuResponse.getUser(pid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              filterdata = snapshot.data.data;
              return ListView.builder(
                itemCount: filterdata.length,
                itemBuilder: (context, index) {
                  DataFoodMenu foodMenu = filterdata[index];
                  // desEn = foodMenu.restaurant.descriptionEn;
                  // print(desEn);
                  // if (foodMenu.restaurant.descriptionEn != null) {

                  // } else {
                  //   desEn = 'Error for Null value';
                  // }
                  return Card(
                    elevation: 2,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          saveFcIdList(foodMenu.id);
                          l = foodMenu.id;
                          Route route = MaterialPageRoute(
                            builder: (context) => FoodProductList(),
                          );
                          Navigator.push(context, route);
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4.2,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CachedNetworkImage(
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.8),
                                          BlendMode.dstATop)),
                                ),
                              ),
                              imageUrl: foodMenu.image,
                              placeholder: (context, url) =>
                                  LinearProgressIndicator(
                                minHeight: 1,
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  lan ? foodMenu.nameEn : foodMenu.nameBn,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  lan
                                      ? 'Phone Number  ${foodMenu.restaurant.phoneEn}'
                                      : 'ফোন নাম্বার  ${foodMenu.restaurant.phoneBn} ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(lan ? 'Bali Arcade Mall' : 'বালি আরকেড মল',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: LinearProgressIndicator(
                  minHeight: 2,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void saveFcIdList(var fcidList) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('fcidList', fcidList.toString());
    // pref.setString('desEn', desEn);
  }
}
