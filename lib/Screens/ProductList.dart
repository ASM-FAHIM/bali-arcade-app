import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'Cart.dart';
import 'dart:async';
import 'cart_screen.dart';
import 'package:provider/provider.dart';

List storedata = [];
List filterdata = [];
var lan;

//for adding the cart
String name;
String id;
var image;
var price;
int quantity;
String shop_Id;

//ForPursingDouble
double mydoubleprice;
double discountss;

//banglatoEnglishConverterfor Price
var p;
//banglatoEnglishConverterfor Discount
var diss;

class ProductList extends StatefulWidget {
  ProductList({Key key}) : super(key: key);
  static String id = 'productList';
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  var isLoading = false;
  List _selectedIndex = [];

  //replace bangla number
  String replaceBanglaNumber(String input) {
    const english = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
    const bangla = ["১", "২", "৩", "৪", "৫", "৬", "৭", "৮", "৯", "০"];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(bangla[i], english[i]);
    }

    return input;
  }

  Future<bool> getFoodData() async {
    //get the save pcidList usign Sharedpreferrences
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool p2 = pref.getBool('lan');
    var pc = pref.getString('pcidList');
    setState(() {
      lan = p2;
    });
    String url =
        'http://baliarcade.work/api/baliarcade/all/product/$pc';

    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (mounted) {
        setState(() {
          filterdata = storedata = json.decode(response.body.toString());
          isLoading = true;
        });
      }
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getFoodData();
  }

  //searching
  void _filterCountries(value) {
    setState(() {
      filterdata = storedata
          .where((index) => index[lan ? 'name_en' : 'name_bn']
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
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
                  stops: [0.5, 0.5],
                  colors: [Colors.grey, Colors.grey],
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 25.0,
                        left: 5,
                        right: 5,
                      ),
                      child: Container(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide.none),
                          color: Colors.grey[800],
                          elevation: 2,
                          onPressed: () {},
                          child: Container(
                            width: double.infinity,
                            color: Colors.grey[800],
                            padding: EdgeInsets.all(5),
                            child: Row(children: [
                              Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 160,
                                height: 25,
                                child: TextField(
                                  onChanged: (value) {
                                    _filterCountries(value);
                                  },
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: lan
                                        ? 'Search  for Category'
                                        : 'কাঙ্খিত পণ্যটি খুজুন',
                                    hintStyle: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1),
                                    ),
                                  ),
                                ),
                              ),
                              cart.itemCount > 0
                                  ? GestureDetector(
                                      onTap: () => Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => CartScreen(),
                                      )),
                                      child: Stack(
                                        fit: StackFit.loose,
                                        overflow: Overflow.clip,
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12,
                                                bottom: 14,
                                                left: 8,
                                                right: 8),
                                            child: Icon(
                                              Icons.add_shopping_cart,
                                              size: 42,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              width: 22,
                                              height: 22,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xff660066),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '${cart.itemCount}',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(bottom: 2),
                                      child: Container(
                                        child: Stack(
                                          fit: StackFit.loose,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: IconButton(
                                                  icon: Icon(
                                                    Icons.add_shopping_cart,
                                                    size: 35,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () => showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          // return object of type Dialog
                                                          return AlertDialog(
                                                            content: new Text(lan
                                                                ? "Dear Customer ,There is no product in Cart"
                                                                : "প্রিয় গ্রাহক ,কার্ট এ এখন ও কোনো  আইটেম অ্যাড করা হইনি"),
                                                            actions: <Widget>[
                                                              // usually buttons at the bottom of the dialog
                                                              FlatButton(
                                                                child: new Text(
                                                                    lan
                                                                        ? "Ok"
                                                                        : "ওকে"),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                              IconButton(
                                iconSize: 40,
                                icon: Text(
                                  lan ? 'Back' : 'ব্যাক',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
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
                  isLoading
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: filterdata.length,
                            itemBuilder: (context, index) {
                              //final _isSelected=  _selectedIndex.contains(index);
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Card(
                                      elevation: 25,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4.4,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.rectangle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.white,
                                                offset: const Offset(0.2, 1.5),
                                                blurRadius: 1.0,
                                                spreadRadius: 2.0,
                                              )
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                child: CachedNetworkImage(
                                                  filterQuality:
                                                      FilterQuality.high,
                                                  fit: BoxFit.fill,
                                                  imageUrl: filterdata[index]
                                                      ['image'],
                                                  placeholder: (context, url) =>
                                                      LinearProgressIndicator(
                                                    minHeight: 1,
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                              width: 100,
                                              height: 120,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    lan
                                                        ? '${filterdata[index]['name_en']}'
                                                        : '${filterdata[index]['name_bn']}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    lan
                                                        ? 'Size : ${filterdata[index]['size_en']}'
                                                        : 'সাইজ : ${filterdata[index]['size_bn']}',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    lan
                                                        ? 'Price : Tk ${filterdata[index]['price_en']}'
                                                        : 'প্রাইস : ৳ ${filterdata[index]['price_bn']}',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                      lan
                                                          ? 'Discount : Tk ${filterdata[index]['discount_en']}'
                                                          : 'ডিসকাঊণ্ট : ৳ ${filterdata[index]['discount_bn']}',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                      lan
                                                          ? 'Quainty : ${filterdata[index]['quantity_en']}'
                                                          : 'কোয়ান্টিটি : ৳ ${filterdata[index]['quantity_bn']}',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    name = lan
                                                        ? filterdata[index]
                                                            ['name_en']
                                                        : filterdata[index]
                                                            ['name_bn'];
                                                    id = filterdata[index]['id']
                                                        .toString();
                                                    image = filterdata[index]
                                                        ['image'];
                                                    price = lan
                                                        ? filterdata[index]
                                                            ['price_en']
                                                        : filterdata[index]
                                                            ['price_bn'];

                                                    //shop_id
                                                    shop_Id = filterdata[index]
                                                        ['shop_id'];

                                                    var proId =
                                                        filterdata[index]
                                                                ['product_id']
                                                            .toString();
                                                    print(proId);

                                                    //Bangla to english converter
                                                    p = replaceBanglaNumber(
                                                        price);
                                                    mydoubleprice =
                                                        double.parse(p);

                                                    var di;
                                                    di = lan
                                                        ? filterdata[index]
                                                                ['discount_en']
                                                            .toString()
                                                        : filterdata[index]
                                                                ['discount_bn']
                                                            .toString();

                                                    diss =
                                                        replaceBanglaNumber(di);
                                                    discountss =
                                                        double.parse(diss);
                                                    print(discountss);

                                                    //   // quantity = 1;
                                                    //   openSheet(name);

                                                    setState(() {
                                                      // if (_isSelected) {
                                                      //   _selectedIndex
                                                      //       .remove(index);
                                                      // } else {

                                                      // }

                                                      Provider.of<Cart>(context,
                                                              listen: false)
                                                          .addItem(
                                                              id,
                                                              name,
                                                              shop_Id,
                                                              proId,
                                                              "NULL",
                                                              "NULL",
                                                              mydoubleprice,
                                                              quantity,
                                                              image,
                                                              discountss);
                                                      // _selectedIndex.add(index);
                                                    });
                                                  },
                                                  child: Card(
                                                    elevation: 20,
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color(
                                                                    0xff660066),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .white,
                                                                  offset:
                                                                      const Offset(
                                                                          0.6,
                                                                          0.6),
                                                                  blurRadius:
                                                                      4.0,
                                                                  spreadRadius:
                                                                      0.8)
                                                            ]),
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10,
                                                                left: 12),
                                                        height: 40,
                                                        width: 100,
                                                        child: Text(
                                                          lan
                                                              ? 'Add to Cart'
                                                              : 'কার্টে অ্যাড করুন',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      : Center(
                          child: LinearProgressIndicator(
                            minHeight: 2,
                          ),
                        ),
                ],
              ),
            ),
          );
  }
}
