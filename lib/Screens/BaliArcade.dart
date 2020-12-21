import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var lan;

class BaliArcadePage extends StatefulWidget {
  BaliArcadePage({Key key}) : super(key: key);

  @override
  _BaliArcadePageState createState() => _BaliArcadePageState();
}

class _BaliArcadePageState extends State<BaliArcadePage> {
  getLan() async {
    //get the save pid usign Sharedpreferrences

    SharedPreferences pref = await SharedPreferences.getInstance();
    bool p = pref.getBool('lan');
    setState(() {
      lan = p;
    });
  }

  @override
  void initState() {
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
            backgroundColor: Colors.grey,
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 15, right: 15, bottom: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Color(0xFF5e5e5e),
                        child: Container(
                          height: 380,
                          width: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                'images/logo_white.png',
                                height: 60,
                                width: 150,
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        lan ? 'Address : ' : 'অ্যাডরেস : ',
                                        style: TextStyle(
                                            color: Colors.amber, fontSize: 20),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      lan
                                          ? '227, Nawab Sirajuddula Road,(Opposite of the Post Office), ChawkBazar, Chittagong'
                                          : '২২৭, নওয়াব সিরাজুডোলা রোড (পোস্ট অফিস এর অপর পাশে), চকবাজার, চট্টগ্রাম',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        lan ? 'Builders : ' : 'বিল্ডারস : ',
                                        style: TextStyle(
                                            color: Colors.amber, fontSize: 20),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      lan
                                          ? 'Seth Properties Limited'
                                          : 'শেঠ প্রপার্টিজ লিমিটেড',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        lan ? 'Contacts : ' : 'কন্ট্যাক :',
                                        style: TextStyle(
                                            color: Colors.amber, fontSize: 20),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      lan
                                          ? '+880312868282, +8801872613507, +8801872613505, +8801872613508'
                                          : '+৮৮০৩১২৮৬৮২৮২, +৮৮০১৮৭২৬১৩৫০৭, +৮৮০১৮৭২৬১৩৫০৫, +৮৮০১৮৭২২৬১৩৫০৮',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset('images/home_screen.jpg'),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                lan
                                    ? 'Night Mood of Bali Arcade'
                                    : 'নাইট মোড অফ বালি আরকেড',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset('images/image_Amusementpark_bg.png'),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                lan ? 'Amusement Park' : 'এমোউসমেন্ট পার্ক',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset('images/language_select.jpg'),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                lan
                                    ? 'Day Mood of Bali Arcade'
                                    : 'ডে মোড অফ বালি আরকেড',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset('images/shop_bg.jpg'),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                lan ? 'Shopping Floor' : 'শপিং ফ্লোর',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
