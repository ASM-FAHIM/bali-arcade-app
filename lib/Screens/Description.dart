import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

String descriptionEn;

class Description extends StatefulWidget {
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  String website = 'http://ringersoft.com/';
  String email = 'https://mail.google.com/mail/u/0/#inbox?compose=new';
  String facebook =
      'https://www.facebook.com/RingerSoft24x7/?ref=page_internal';
  String map =
      'https://www.google.com/maps/place/Ringer+Soft+Limited/@22.367787,91.8232116,17z/data=!4m5!3m4!1s0x30ad277e31820a99:0xc160e66032fbcb83!8m2!3d22.367787!4d91.8254003';

  Future<void> launchwebsite(String url) async {
    if (await canLaunch(website)) {
      await launch(website, forceSafariVC: true, forceWebView: false);
    } else {
      throw 'Could Not launch $url';
    }
  }

  Future<void> launchemail(String url) async {
    if (await canLaunch(email)) {
      await launch(email, forceSafariVC: true, forceWebView: false);
    } else {
      throw 'Could Not launch $url';
    }
  }

  Future<void> launchfb(String url) async {
    if (await canLaunch(facebook)) {
      await launch(facebook, forceSafariVC: true, forceWebView: false);
    } else {
      throw 'Could Not launch $url';
    }
  }

  Future<void> launchmap(String url) async {
    if (await canLaunch(map)) {
      await launch(map, forceSafariVC: true, forceWebView: false);
    } else {
      throw 'Could Not launch $url';
    }
  }

  // Future<bool> getDescription() async {
  //   //get the save pid usign Sharedpreferrences
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String desEn = pref.getString('desEn');
  //   setState(() {
  //     descriptionEn = desEn;
  //   });
  //   return true;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDescription();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.5],
            colors: [Colors.grey, Colors.black54],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                        icon: Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          launchmap(map);
                        }),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                        icon: Icon(
                          Icons.call,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.globe,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          launchwebsite(website);
                        }),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                        icon: Icon(
                          Icons.email,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          launchemail(email);
                        }),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Card(
                    color: Colors.black,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.facebookF,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          launchfb(facebook);
                        }),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Divider(
                color: Colors.white,
                height: 10,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "DESCRIPTION",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.white,
                height: 10,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  //descriptionEn,
                  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
