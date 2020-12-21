import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bali_arcade/screens/summaryPage.dart';
import 'Cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

//getlanguage
var lan;

var d;
var discount;
var prices;
var quantitys;
var total;
var p;
var qq = '0';
var t;
String replaceEnglishNumber(String input) {
  const english = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
  const bangla = ["১", "২", "৩", "৪", "৫", "৬", "৭", "৮", "৯", "০"];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], bangla[i]);
  }

  return input;
}

class CartSum extends StatefulWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String name;
  var image;
  var dis;

  CartSum(this.id, this.productId, this.price, this.quantity, this.name,
      this.image, this.dis);
  @override
  _CartSumState createState() => _CartSumState();
}

class _CartSumState extends State<CartSum> {
  Future<bool> getLan() async {
    //get the save lan usign Sharedpreferrences
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool p2 = pref.getBool('lan');
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
    prices = widget.price;
    quantitys = widget.quantity;
    total = widget.price * widget.quantity;
    d = widget.dis;
    p = replaceEnglishNumber(prices.toString());
    qq = replaceEnglishNumber(quantitys.toString());
    t = replaceEnglishNumber(total.toString());
    discount = replaceEnglishNumber(d.toString());
    var c = widget.quantity * widget.dis;

    return lan == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.quantity == 0
                ? null
                : Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.name,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            lan
                                                ? 'Tk $prices x $quantitys'
                                                : '৳ $p x $qq',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            lan ? ' = Tk $total' : ' = ৳ $t',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Expanded(
                                    //       flex: 4,
                                    //       child: Text(
                                    //         '৳ ডিসকাউন্ট :$discount x $qq ',
                                    //         style: TextStyle(
                                    //             fontSize: 12,
                                    //             color: Colors.black,
                                    //             fontWeight: FontWeight.w500),
                                    //       ),
                                    //     ),
                                    //     Expanded(
                                    //       flex: 2,
                                    //       child: Text(
                                    //         ' = ৳ $c',
                                    //         style: TextStyle(
                                    //             fontSize: 12,
                                    //             color: Colors.black,
                                    //             fontWeight: FontWeight.w500),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          );
  }
}
