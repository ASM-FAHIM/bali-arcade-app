import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Cart.dart';
import 'cart_item.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'summaryPage.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

//language check
var lan;

String name;
int quantity;
double price;
String shippingCost;
double grandTotal;
String email;

String jsonn;
String productId;
String proID;
String shopID;
String resID;
String menuID;
String unit_quantity;
String unitcost;
String unit_total;
String jsonTutorial;
List<Tag> tags;

var tAmount;
String t;

class Tag {
  String product_id;
  String shop_id;
  String res_id;
  String menu_id;
  String unit_quantity;
  String unitcost;
  String unit_total;

  Tag(this.product_id, this.shop_id, this.res_id, this.menu_id,
      this.unit_quantity, this.unitcost, this.unit_total);

  Map toJson() => {
        'shop_id': shop_id,
        'product_id': product_id,
        'restaurant_id': res_id,
        'menu_id': menu_id,
        'unit_quantity': unit_quantity,
        'unit_cost': unitcost,
        'unit_total': unit_total
      };
}

class Tutorial {
  String title;
  String description;

  List<Tag> tags;

  Tutorial([this.tags]);

  Map toJson() {
    List<Map> tags =
        this.tags != null ? this.tags.map((i) => i.toJson()).toList() : null;

    return {
      "email": email,
      "total_quantity": quantity.toString(),
      "total": price.toString(),
      "shipping_cost": '70',
      "grandtotal": grandTotal.toString(),
      'items': tags
    };
  }
}

String replaceEnglishNumber(String input) {
  const english = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
  const bangla = ["১", "২", "৩", "৪", "৫", "৬", "৭", "৮", "৯", "০"];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], bangla[i]);
  }

  return input;
}

class CartScreen extends StatefulWidget {
  static String id = '/cartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<bool> getLan() async {
    //get the save lan usign Sharedpreferrences
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool p2 = pref.getBool('lan');
    email = pref.getString('emails');
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
    final cart = Provider.of<Cart>(context);
    price = cart.totalAmount;
    quantity = cart.totalQuantity;
    grandTotal = cart.grandAmount;

    //product data
    proID = cart.productId.toString();
    menuID = cart.menuId.toString();
    resID = cart.resId.toString();
    print('This is cart Screen Resturant ID' + resID);
    shopID = cart.shopId.toString();
    print('This is Cart Screen ' + shopID);
    productId = cart.productId.toString();
    unit_quantity = cart.unitQuantity.toString();
    unit_total = cart.unitTotal.toString();
    unitcost = cart.unitCost.toString();

    tags = [
      Tag(proID, shopID, resID, menuID, unit_quantity, unitcost, unit_total)
    ];
    jsonn = jsonEncode(tags);
    print(jsonn);
    Tutorial tutorial = Tutorial(tags);
    jsonTutorial = jsonEncode(tutorial);
    print(jsonTutorial);

    tAmount = cart.totalAmount;
    t = replaceEnglishNumber(tAmount.toString());

    return lan == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: Padding(
              padding:
                  const EdgeInsets.only(top: 35, left: 8, right: 8, bottom: 5),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 20,
                shadowColor: Colors.grey,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.cancel,
                            size: 25,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          lan ? 'List of Product' : 'পণ্য এর তালিকা',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: cart.items.length,
                          itemBuilder: (ctx, i) => CartPdt(
                              cart.items.values.toList()[i].id,
                              shopID = cart.items.values.toList()[i].shopId,
                              proID = cart.items.values.toList()[i].proId,
                              resID = cart.items.values.toList()[i].resId,
                              menuID = cart.items.values.toList()[i].menuId,
                              // cart.items.keys.toList()[i],
                              cart.items.values.toList()[i].price,
                              cart.items.values.toList()[i].quantity,
                              cart.items.values.toList()[i].name,
                              cart.items.values.toList()[i].image,
                              cart.items.values.toList()[i].discount)),
                    ),
                    Container(
                      height: 40,
                      child: Text(
                        lan
                            ? 'Total Product Price : Tk $tAmount '
                            : 'পণ্য এর মোট মূল্য : ৳ $t',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    cart.totalAmount < 500
                        ? Container(
                            child: Text(
                              lan
                                  ? 'Dear Customer,You have to market at least 500 Tk'
                                  : 'প্রিয় গ্রাহক ,আপানকে সর্বনিম্ন ৫০০ টাকার \n                 বাজার করতে হবে',
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          )
                        : Container(
                            width: double.infinity,
                            child: Text(''),
                          ),
                    RaisedButton(
                      onPressed: () async {
                        cart.grandAmount > 500
                            ? postRequest(context, jsonTutorial)
                            //combineWork(context,jsonTutorial)
                            : Toast.show(
                                "প্রিয় গ্রাহক ,আপানকে সর্বনিম্ন ৫০০ টাকার বাজার করতে হবে",
                                context,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                duration: Toast.LENGTH_SHORT,
                                gravity: Toast.CENTER);
                        print('This is ' + jsonTutorial);
                        //   // cart.clear();
                      },
                      color: Color(0xff660066),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        child: Center(
                            child: Text(
                          lan ? 'Make Order' : 'অর্ডার করুন',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Future<http.Response> postRequest(
      BuildContext context, String jsonTutorial) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('json', jsonTutorial);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => OrderPage(),
    ));
  }
}
