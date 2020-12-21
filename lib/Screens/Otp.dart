import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String codeVeri;
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
    listenotp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 400,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black38),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'images/logo_white.png',
                          height: 80,
                          width: 180,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Enter the Code",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "From Email we just Sent",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: PinFieldAutoFill(
                            decoration: UnderlineDecoration(
                                textStyle: TextStyle(color: Colors.amber),
                                colorBuilder: FixedColorBuilder(Colors.white)
                                // color: Colors.grey,
                                // enteredColor: Colors.grey,
                                // solidColor: Colors.grey,
                                ),
                            codeLength: 4,
                            onCodeChanged: (val) {
                              codeVeri = val;
                              print(codeVeri);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        RaisedButton(
                            color: Color(0xFF680068),
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async {
                              await accountVerification(codeVeri);
                            }),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void listenotp() async {
    await SmsAutoFill().listenForCode;
  }

  Future<void> accountVerification(String code) async {
    String myurl =
        "http://baliarcade.work/api/baliarcade/customer/account-verification";
    await http.post(myurl, headers: {
      'Accept': 'application/json',
    }, body: {
      "email": emailsVeri,
      "code": code,
    }).then((response) {
      print(response.statusCode);
    });
    Navigator.pushNamed(context, LoginPage.id);
  }
}
