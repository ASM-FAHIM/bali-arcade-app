import 'package:bali_arcade/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'Otp.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);
  static String id = 'signUpPage';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _value = false;
  TextEditingController uName = TextEditingController();
  TextEditingController uEmail = TextEditingController();
  TextEditingController uPassword = TextEditingController();
  TextEditingController uConPassword = TextEditingController();

  bool _valideName = false;
  bool _valideEmail = false;
  bool _validePass = false;
  bool _valideConPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.5],
          colors: [Colors.black, Colors.grey],
        ),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 10),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 25.0, left: 55, right: 55, bottom: 10),
                child: Image.asset(
                  'images/logo_white.png',
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Color(0xFF5e5e5e),
              elevation: 8,
              child: Container(
                height: 390,
                width: 300,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, left: 12, right: 12, bottom: 16),
                        child: Text(
                          'sign'.tr().toString(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            controller: uName,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Colors.amber,
                                fontSize: 8,
                              ),
                              errorText:
                                  _valideName ? 'User name is Empty' : null,
                              suffixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.white,
                                size: 35,
                              ),
                              //Image.asset('images/icon_username.png'),
                              hintText: 'username'.tr().toString(),
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: Container(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: uEmail,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Colors.amber,
                                fontSize: 8,
                              ),
                              errorText: _valideEmail ? 'Email is Empty' : null,
                              suffixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 35,
                              ),
                              //Image.asset('images/icon_email.png'),
                              hintText: 'e-mail'.tr().toString(),
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            controller: uPassword,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Colors.amber,
                                fontSize: 8,
                              ),
                              errorText: _validePass
                                  ? 'Password Can\'t Be Empty'
                                  : null,
                              suffixIcon: Icon(
                                Icons.lock_open,
                                color: Colors.white,
                                size: 35,
                              ),
                              //  Image.asset('images/icon_password.png'),
                              hintText: 'password'.tr().toString(),
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            controller: uConPassword,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Colors.amber,
                                fontSize: 8,
                              ),
                              errorText: _valideConPass
                                  ? 'Confirm Password is Empty'
                                  : null,
                              suffixIcon: Icon(
                                Icons.lock,
                                size: 35,
                                color: Colors.white,
                              ),
                              // Image.asset(
                              //   'images/icon_lock.png',
                              //   color: Colors.white,
                              // ),
                              hintText: 'confirm'.tr().toString(),
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.white,
                            ),
                            child: Checkbox(
                              checkColor: Colors.black,
                              activeColor: Colors.white,
                              focusColor: Colors.black,
                              value: _value,
                              onChanged: (bool value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                          ),
                          Text(
                            'term'.tr().toString(),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: RaisedButton(
                          onPressed: () async {
                            final signcode =
                                await SmsAutoFill().getAppSignature;
                            print(signcode);
                            setState(() {
                              signUpMethod();
                            });
                          },
                          elevation: 16,
                          child: Text(
                            'sign'.tr().toString(),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                          color: Color(0xff660066),
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    ));
  }

  void signUpMethod() async {
    String uNames = uName.text;
    String uEmails = uEmail.text;
    String uPasswords = uPassword.text;
    String uConPasswords = uConPassword.text;
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (uNames.isEmpty) {
      _valideName = true;
    }
    if (uEmails.isEmpty) {
      _valideEmail = true;
    }

    if (uPasswords.isEmpty) {
      _validePass = true;
    }
    if (uConPasswords.isEmpty) {
      _valideConPass = true;
    }

    if (uNames.isNotEmpty &&
        uEmails.isNotEmpty &&
        regex.hasMatch(uEmails) &&
        uPasswords.length > 5 &&
        uPasswords.isNotEmpty &&
        uConPasswords.contains(uPasswords)) {
      if (_value == true) {
        await confirmPost(uEmails, uNames, uPasswords);
        Toast.show("Successfully saved the information", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));

        uName.clear();
        uEmail.clear();
        uPassword.clear();
        uConPassword.clear();
      } else {
        Toast.show("Please Confirm Terms and Privacy Policy", context,
            duration: Toast.LENGTH_SHORT,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            gravity: Toast.CENTER);
      }
    } else {
      if (uPasswords.length < 5) {
        Toast.show("Password must be atleast 6 character", context,
            duration: 2, gravity: Toast.CENTER);
      }
      if (!uConPasswords.contains(uPasswords)) {
        Toast.show("Password is not match", context,
            duration: 2, gravity: Toast.CENTER);
      }

      if (!regex.hasMatch(uEmails)) {
        Toast.show("Email is not validate", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
      }
    }
  }

  Future confirmPost(String emails, String names, String passwords) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', emails);
    pref.setString('password', passwords);
    print(emails);
    print(names);
    print(passwords);
    String myurl =
        "http://baliarcade.work/api/baliarcade/customer/sign-up";
    await http.post(myurl, headers: {
      'Accept': 'application/json',
    }, body: {
      "email": emails,
      "name": names,
      "password": passwords
    }).then((response) {
      print(response.statusCode);
    });
  }
}
