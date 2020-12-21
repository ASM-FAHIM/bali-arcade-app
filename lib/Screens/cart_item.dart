import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Cart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';


//Language Check
var lan;

var prices;
var quantitys;
var total;
var p;
var qq = '0';
var t;
var discount;

//replaceEnglishNumber
String replaceEnglishNumber(String input) {
  const english = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
  const bangla = ["১", "২", "৩", "৪", "৫", "৬", "৭", "৮", "৯", "০"];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], bangla[i]);
  }

  return input;
}

class CartPdt extends StatefulWidget {
  //final String id;
  final String iid;
  final String shopId;
  final String proId;
  final String resId;
  final String menuId;
  final double price;
  final int quantity;
  final String name;
  var image;
  var discount;

  CartPdt(this.iid, this.shopId, this.proId, this.resId, this.menuId,
      this.price, this.quantity, this.name, this.image, this.discount);

  @override
  _CartPdtState createState() => _CartPdtState();
}

class _CartPdtState extends State<CartPdt> {
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
    var shopNo = widget.shopId;
    print("shop Id is " + shopNo);
    var resNo = widget.resId;
    print('Res No' + resNo);
    prices = widget.price;
    print(prices);
    quantitys = widget.quantity;
    print(quantitys);
    total = widget.price * widget.quantity;
    print(total);
    p = replaceEnglishNumber(prices.toString());
    qq = replaceEnglishNumber(quantitys.toString());
    t = replaceEnglishNumber(total.toString());
    // discount = widget.discount;
    // print("This is dicount in cartItem $discount");
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
                      height: 75,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: 2,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(1)),
                                      image: DecorationImage(
                                          image: NetworkImage(widget.image),
                                          fit: BoxFit.fitHeight)),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
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
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      //'ট $p x $qq = $t',
                                      lan
                                          ? 'Tk $prices x $quantitys = $total'
                                          : 'ট $p x $qq = $t',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (quantitys == 1) {
                                        Provider.of<Cart>(context,
                                                listen: false)
                                            .removeItem(widget.iid);
                                        // Provider.of<Cart>(context,
                                        //         listen: false)
                                        //     .removeItem(widget.shopId);
                                      } else {
                                        Provider.of<Cart>(context,
                                                listen: false)
                                            .removeSingleItem(
                                                widget.iid,
                                                widget.shopId,
                                                widget.proId,
                                                widget.resId,
                                                widget.menuId,
                                                widget.name,
                                                prices,
                                                quantitys,
                                                widget.image,
                                                discount);
                                      }
                                    });
                                  },
                                  child: Icon(FontAwesomeIcons.minus, size: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // Provider.of<Cart>(context, listen: false)
                                      //     .addItem(id, name, mydoubleprice, 1, image,
                                      //         discount);
                                      Provider.of<Cart>(context, listen: false)
                                          .addItem(
                                              widget.iid,
                                              widget.name,
                                              widget.shopId,
                                              widget.proId,
                                              widget.resId,
                                              widget.menuId,
                                              prices,
                                              1,
                                              widget.image,
                                              discount);
                                    });
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    size: 18,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () =>
                                    Provider.of<Cart>(context, listen: false)
                                        .removeItem(widget.iid),
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
