import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'cart_sum.dart';
import 'Cart.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//forlanguageCheck
var lan;

String email;
String jsonTuitorial;
String jsonTuitorials;
var t;
var grandT;
String gradTotal;
String totalDiscount;
double dis;
var ddd;

class OrderPage extends StatefulWidget {
  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  String dropdownValue;
  TextEditingController uName = TextEditingController();
  TextEditingController uPhone = TextEditingController();
  TextEditingController uLocation = TextEditingController();

  bool _valideName = false;
  bool _validePhone = false;
  bool _valideLocation = false;
  int pressed = 0;
  bool isVisible = false;
  String replaceEnglishNumber(String input) {
    const english = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
    const bangla = ["১", "২", "৩", "৪", "৫", "৬", "৭", "৮", "৯", "০"];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], bangla[i]);
    }

    return input;
  }

  getdata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    jsonTuitorial = pref.getString('jsonn');
    bool p2 = pref.getBool('lan');
    email = pref.getString('emails');

    setState(() {
      lan = p2;
    });
    print('This is jsonTuitorail');
    print(jsonTuitorials);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getdata();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    dis = cart.totalDiscount;
    ddd = replaceEnglishNumber(dis.toString());
    print(ddd);
    t = cart.totalAmount.toString();
    grandT = cart.grandAmount.toString();
    gradTotal = replaceEnglishNumber(grandT);
    total = replaceEnglishNumber(t);

    return lan == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff660066),
              leading: RaisedButton(
                  disabledElevation: 0,
                  color: Color(0xff660066),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  }),
              title: Text(lan ? "Bali Arcade" : 'বালি আরকেড'),
            ),
            body: pressed >= 1
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              lan ? 'ORDER SUMMARY' : "অর্ডার সামারি",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 200,
                            child: ListView.builder(
                                itemCount: cart.items.length,
                                itemBuilder: (ctx, i) => CartSum(
                                    cart.items.values.toList()[i].id,
                                    cart.items.keys.toList()[i],
                                    cart.items.values.toList()[i].price,
                                    cart.items.values.toList()[i].quantity,
                                    cart.items.values.toList()[i].name,
                                    cart.items.values.toList()[i].image,
                                    cart.items.values.toList()[i].discount)),
                          ),
                          Divider(
                            height: 2,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Text(
                                  lan ? 'Product Price : ' : 'পণ্যের মূল্য : ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  lan ? '= Tk $t' : ' = ৳ $total',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       flex: 4,
                          //       child: Text(
                          //         lan?'Delivery Charge : ':'ডেলিভারি চার্জ : ',
                          //         style: TextStyle(
                          //             fontSize: 12,
                          //             color: Colors.black,
                          //             fontWeight: FontWeight.w500),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       flex: 2,
                          //       child: Text(
                          //         lan?' = ৳ ৭০.০',
                          //         style: TextStyle(
                          //             fontSize: 12,
                          //             color: Colors.black,
                          //             fontWeight: FontWeight.w500),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 8,
                          // ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Text(
                                  lan
                                      ? 'Total Discount : '
                                      : 'টোটাল ডিসকাউন্ট : ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  lan ? ' = Tk $dis' : ' = ৳ $ddd',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 2,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Text(
                                  lan ? 'Total Price : ' : 'সর্বমোট মূল্য : ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  lan ? ' = Tk $grandT' : ' = ৳ $gradTotal',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Center(
                            child: Text(
                              lan ? 'Delivery Address' : "ডেলিভারি ঠিকানা",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.black),
                            controller: uName,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Colors.amber,
                                fontSize: 8,
                              ),
                              errorText: _valideName ? 'নাম পূরণ করুন' : null,
                              suffixIcon: Icon(FontAwesomeIcons.user,
                                  color: Colors.black),
                              //Image.asset('images/icon_username.png'),
                              hintText: lan ? 'Name' : 'নাম',
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                            ),
                          ),
                          TextField(
                            style: TextStyle(color: Colors.black),
                            controller: uPhone,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Colors.amber,
                                fontSize: 8,
                              ),
                              errorText: _validePhone
                                  ? lan
                                      ? 'Enter Mobile Number'
                                      : 'মোবাইল নাম্বার পূরণ করুন'
                                  : null,
                              suffixIcon: Icon(FontAwesomeIcons.phone,
                                  color: Colors.black),
                              //Image.asset('images/icon_username.png'),
                              hintText:
                                  lan ? 'Mobile Number' : 'মোবাইল নাম্বার',
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                            ),
                          ),
                          TextField(
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            controller: uLocation,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Colors.amber,
                                fontSize: 8,
                              ),
                              errorText: _valideLocation
                                  ? lan ? 'Enter Address' : 'ঠিকানা পূরণ করুন'
                                  : null,
                              suffixIcon: Icon(FontAwesomeIcons.locationArrow,
                                  color: Colors.black),
                              //Image.asset('images/icon_username.png'),
                              hintText: lan ? 'Address' : 'ঠিকানা',
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //  DropdownButton(
                          //       value: dropdownValue,
                          //       icon: Icon(Icons.arrow_drop_down),
                          //       items: <String>[
                          //         lan?'Select Area':'এলাকা সিলেক্ট করুন',
                          //         lan?'Anderkilla':'আন্দরকিল্লা',
                          //         lan?'Arakan Housing':'আরকান হাউজিং',
                          //         lan?'Kazir Dewry':'কাজীর দেউড়ি',
                          //         lan?'KatalGonj':'কাতালগঞ্জ',
                          //         lan?'Kapashgola':'কাপাসগোলা' ,
                          //         lan?'Khulshi':'খুলসি',
                          //         lan?'Goribullah Shah Area':'গরিবুল্লা শাহ এরিয়া',
                          //         lan?'Chawkbazar':'চকবাজার',
                          //          lan?'Chandgao Avashik':'চান্দগাও আবাসিক',
                          //          lan?'Jamal Khan':'জামাল খান',
                          //          lan?'GEC':'জি ই সি',
                          //          lan?'Dewan Bazar':'দেওয়ান বাজার',
                          //          lan?'Nasirabad':'নাসিরাবাদ' ,
                          //         lan? 'New Market':'নিউ মার্কেট' ,
                          //          lan?'Panchlaish':'পাঁচশাইল',
                          //         lan? 'Mehedibag':'মেহেদিবাগ',
                          //          lan?'Love Layen':'লাভ লেইন',
                          //          lan?'Lalkhan Bazar':'লালখান বাজার',
                          //          lan?'ShulokBohor':'শুলকবহর',
                          //         lan? 'Shugondha':'সুগন্ধা'
                          //       ].map<DropdownMenuItem<String>>((String value) {
                          //         return DropdownMenuItem<String>(
                          //           value: value,
                          //           child: Text(value),
                          //         );
                          //       }).toList(),
                          //       onChanged: (newValue) {
                          //         setState(() {
                          //           //dropdownValue = newValue;
                          //           uLocation.text = newValue;
                          //         });
                          //       },
                          //     ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            lan
                                ? 'Select Your Payment'
                                : "কিভাবে পেমেন্ট করবেন?",
                            style: TextStyle(fontSize: 15),
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: 1,
                                activeColor: Colors.pinkAccent,
                                onChanged: (value) {},
                              ),
                              Text(
                                lan ? 'Cash On Delivery' : "ক্যাশ অন ডেলিভারি",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          RaisedButton(
                            onPressed: () async {
                              storeMethod(context, jsonTuitorials);
                              Toast.show(
                                  "Please wait for Order Processing", context,
                                  duration: 2, gravity: Toast.CENTER);
                              setState(() {
                                pressed++;
                              });
                            },
                            color: Color(0xff660066),
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              child: Center(
                                  child: Text(
                                lan ? 'Confirm Order' : 'অর্ডার কনফার্ম করুন',  
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

  void storeMethod(BuildContext context, String jsonTutorial) async {
    String uNames = uName.text;
    String uPhones = uPhone.text;
    String uLocations = uLocation.text;

    if (uPhones.isEmpty) {
      _validePhone = true;
    }

    if (uNames.isEmpty) {
      _valideName = true;
    }
    if (uLocations.isEmpty) {
      _valideLocation = true;
    }

    if (uPhones.isEmpty && uNames.isEmpty && uLocations.isEmpty) {
      Toast.show("Please fill up the Form", context,
          duration: 2, gravity: Toast.CENTER);
    }
    if (uPhones.isNotEmpty && uLocations.isNotEmpty && uNames.isNotEmpty) {
      await postRequest(context, jsonTutorial);
      await confirmPost(email, uNames, uPhones, uLocations);
      uPhone.clear();
      uName.clear();
      uLocation.clear();
      Provider.of<Cart>(context, listen: false).clear();
      setState(() {
        pressed = 0;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog

          return AlertDialog(
            content: new Text(lan
                ? "Your valuable order will be confirmed with verification call / SMS shortly"
                : "কিচ্ছুক্ষণ এর মধ্যে ভেরিফিকেশন কল / এসএমএস দিয়ে আপনার মূল্যবান অর্ডারটি নিশ্চিত করা হবে"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              FlatButton(
                child: new Text(lan ? "Ok" : "ওকে"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() { 
                    isVisible = true;
                  });
                },
              ),
            ],
          );
        },  
      );
    }
  }

  Future<http.Response> postRequest(
      BuildContext context, String jsonTutorial) async {
    var url = 'http://baliarcade.ringersoft.com/api/baliarcade/order-confirm';

    // Map data = {
    //   'apikey': '12345678901234567890'
    // }
    // encode Map to JSON

    var response = await http.post(url, body: jsonTutorial);
    print('Woww   ' + jsonTutorial);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  Future confirmPost(
    String email,
    String uNames,
    var phone,
    String uAddress,
  ) async {
    print(email);  
    print(uNames);
    print(uAddress);
    print(phone);
    String myurl = "http://baliarcade.ringersoft.com/api/baliarcade/order-confirm";
    await http.post(myurl, body: {
      "email": email,
      "payment_by": 'Cash On Delivery',
      "order_type": 'Home Services',
      "name": uNames,
      "pay": gradTotal,
      "shipping_addr": uAddress,
      "phone": phone
    }).then((response) {
      print(response.statusCode);
      print(response.body);
    });
  }
}




