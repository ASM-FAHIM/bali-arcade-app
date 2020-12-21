import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class PasswordResetCode extends StatefulWidget {
  PasswordResetCode({Key key}) : super(key: key);

  @override
  _PasswordResetCodeState createState() => _PasswordResetCodeState();
}

class _PasswordResetCodeState extends State<PasswordResetCode> {
  TextEditingController uPassword = TextEditingController();
  TextEditingController uCode = TextEditingController();
  bool _validePassword = false;
  bool _validCode = false;
  String emailsVeri;

  getEmail() async {
    //get the save pid usign Sharedpreferrences
    SharedPreferences pref = await SharedPreferences.getInstance();
    String e = pref.getString('email');
    setState(() {
      emailsVeri = e;
    });
    print(emailsVeri);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmail();
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
            colors: [Colors.black, Colors.grey],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Color(0xFF5e5e5e),
              elevation: 8,
              child: Container(
                height: 380,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    Image.asset(
                      'images/logo_white.png',
                      height: 70,
                      width: 150,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Enter The Code And  New Password Here',
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30, left: 10, right: 10, bottom: 10),
                      child: Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: uCode,
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 8,
                                ),
                                errorText: _validCode ? 'Code is Empty' : null,
                                suffixIcon: Icon(
                                  Icons.code,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                hintText: 'code'.tr().toString(),
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 10),
                      child: Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: uPassword,
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 8,
                                ),
                                errorText: _validePassword
                                    ? 'New Password is Empty'
                                    : null,
                                suffixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                hintText: 'password'.tr().toString(),
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
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
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      onPressed: () async {
                        setState(() async {
                          await passwordResetCode();
                        });
                      },
                      elevation: 16,
                      child: Text(
                        'submit'.tr().toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      color: Color(0xff660066),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> passwordResetCode() async {
    String password = uPassword.text;
    String code = uCode.text;
    if (password.isEmpty) {
      _validePassword = true;
    }
    if (code.isEmpty) {
      _validCode = true;
    }
    if (password.isNotEmpty && code.isNotEmpty) {
      String myurl =
          "http://baliarcade.work/api/baliarcade/customer/password-reset";
      await http.post(myurl, headers: {
        'Accept': 'application/json',
      }, body: {
        "email": emailsVeri,
        "token": code,
        "password": password
      }).then((response) {
        print(response.statusCode);
      });
      Navigator.pushNamed(context, LoginPage.id);
    } else {
      if (password.isEmpty) {
        Toast.show("Please Enter Your Password", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
      }
      if (code.isEmpty) {
        Toast.show("Please Enter The Reset Code", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
      }
    }
  }
}
