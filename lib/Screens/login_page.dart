import 'package:bali_arcade/Screens/ForgotPassword.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bali_arcade/Screens/dashboard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toast/toast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  static String id = 'loginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Google SignIn Authentication
  GoogleSignIn _googleSignIn = new GoogleSignIn(scopes: ['email']);

  _login() async {
    try {
      await _googleSignIn.signIn();
    } catch (err) {
      print(err);
    }
  }

  int pressed = 0;
  String pass;
  bool _value = false;
  TextEditingController uEmailLog = TextEditingController();
  TextEditingController uPasswordLog = TextEditingController();
  bool _valideEmailLog = false;
  bool _validePassLog = false;
  bool _obsecureText = true;

  void toggle(){
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
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
            child: Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(58.0),
                    child: Image.asset('images/logo_white.png'),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: Color(0xFF5e5e5e),
                  elevation: 8,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.2,
                    width: 300,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'login'.tr().toString(),
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
                              controller: uEmailLog,
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 8,
                                ),
                                errorText: _valideEmailLog
                                    ? 'Email name is Empty'
                                    : null,
                                suffixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                // Image.asset('images/icon_username.png'),
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
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              obscureText: _obsecureText,
                              controller: uPasswordLog,
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 8,
                                ),
                                errorText:
                                    _validePassLog ? 'Password is Empty' : null,
                                suffixIcon: GestureDetector(
                                  child: Icon( _obsecureText ?
                                  FontAwesomeIcons.solidEye : FontAwesomeIcons.solidEyeSlash,
                                      // Icons.remove_circle
                                    color: Colors.white,
                                    size: 25
                                  ), 
                                  onTap: toggle,
                                ),
                                // Image.asset('images/icon_password.png'),
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
                                    print(_value);
                                  });
                                },
                              ),
                            ),
                            Text(
                              'remember'.tr().toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ForgotPassword(),
                                ));
                              },
                              child: Text(
                                'forget'.tr().toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
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
                              setState(() {
                                loginMethod();
                                pressed++;
                              });
                            },
                            elevation: 16,
                            child: Text(
                              'login'.tr().toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            color: Color(0xff660066),
                            textColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, SignUpPage.id);
                            },
                            child: Text(
                              'noaccount'.tr().toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 05,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: Color(0xFF5e5e5e),
                  elevation: 16,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: 300,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'loginwith'.tr().toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                              width: 25,
                            ),
                            // Image.asset('images/mobile.png'),
                            
                            // Icon(FontAwesomeIcons.mobileAlt,
                            //   size: 35,
                            // ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.mobileAlt,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                  Text('WithMobile'.tr().toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16
                                    )
                                  )
                                ],
                              ),
                              
                            ),
                            
                            // SizedBox(
                            //   width: 20,
                            // ),
                            // Image.asset('images/icon_facebook.png'),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: GestureDetector(
                                onTap: () {
                                  _login();
                                },
                                child: Row(
                                  children: [
                                    Image.asset('images/icon_google.png'),
                                    SizedBox(width: 10,),
                                    Text("Withgmail".tr().toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16
                                      ),
                                    )
                                  ],
                                ),
                              ),

                            ),

                            // GestureDetector(
                            //     onTap: () {
                            //       _login();
                            //     },
                            //     child: Image.asset('images/icon_google.png'),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginMethod() async {
    String uEmail = uEmailLog.text;
    String uPasswords = uPasswordLog.text;

    if (uEmail.isEmpty) {
      _valideEmailLog = true;
    }
    if (uPasswords.isEmpty) {
      _validePassLog = true;
    }

    if (uEmail.isEmpty && uPasswords.isEmpty) {
      Toast.show("Please fill up userName and Roll Number", context,
          duration: 2, gravity: Toast.BOTTOM);
    } else {
      await authenticate(uEmail, uPasswords);
    }
  }

  //Customer authenticate
  Future authenticate(String email, String passwords) async {
    String myurl =
        "http://baliarcade.work/api/baliarcade/customer/login";

    await http.post(myurl, headers: {
      'Accept': 'application/json',
    }, body: {
      "email": email,
      "password": passwords
    }).then((response) async {
      print(response.statusCode);
      print(response.headers);
      print(response.body);

      Map mapRes = json.decode(response.body);
      setState(() {
        pass = mapRes['login_status'];
        print(pass);
      });

      if (pass != null) {
        if (_value == true) {
          SharedPreferences savedValue = await SharedPreferences.getInstance();
          await savedValue.setString('emails', email);
        }
        await Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext ctx) => DashBoard()));
        uEmailLog.clear();
        uPasswordLog.clear();
        _valideEmailLog = false;
        _validePassLog = false;
      } else {
        if (email.isNotEmpty && passwords.isEmpty) {
          _validePassLog = true;
        } else if (email.isEmpty && passwords.isNotEmpty) {
          _valideEmailLog = true;
        }
        Toast.show("These credentials do not match our records", context,
            duration: 2, gravity: Toast.BOTTOM);
      }
    });
  }
}
