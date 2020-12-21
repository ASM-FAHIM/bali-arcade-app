import 'package:bali_arcade/Screens/PasswordResetCode.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'Otp.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController uEmail = TextEditingController();
  bool _valideEmail = false;
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
                height: 350,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'images/logo_white.png',
                      height: 90,
                      width: 150,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Enter Your Mail Here',
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30, left: 10, right: 10, bottom: 10),
                      child: Container(
                        height: 80,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                errorText:
                                    _valideEmail ? 'Email is Empty' : null,
                                suffixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                hintText: 'e-mail'.tr().toString(),
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
                        setState(() {
                          forgotMethod();
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

  Future<void> forgotMethod() async {
    String uEmails = uEmail.text;
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (uEmails.isEmpty) {
      Toast.show("Please Enter Your Email", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
    }

    if (uEmails.isNotEmpty && regex.hasMatch(uEmails)) {
      await confirmPost(uEmails);
      Toast.show("Successfully Sent the Email", context,
          duration: Toast.LENGTH_SHORT,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          gravity: Toast.CENTER);

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PasswordResetCode(),
      ));
      uEmail.clear();
    } else {
      if (!regex.hasMatch(uEmails) && uEmails.isNotEmpty) {
        Toast.show("Email is not validate", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
      }
    }
  }

  Future confirmPost(String emails) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', emails);
    print(emails);

    String myurl =
        "http://baliarcade.work/api/baliarcade/customer/password-reset-code";
    await http.post(myurl, headers: {
      'Accept': 'application/json',
    }, body: {
      "email": emails,
    }).then((response) {
      print(response.statusCode);
    });
  }
}
