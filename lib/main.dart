import 'dart:async';
import 'dart:io';
import 'package:bali_arcade/Screens/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'Screens/dashboard.dart';
import 'Screens/language_select.dart';
import 'Screens/login_page.dart';
import 'Screens/signup_page.dart';
import 'Screens/ProductList.dart';
import 'Screens/cineplex.dart';
import 'Screens/AmusementScreen.dart';
import 'Screens/foodCourt.dart';
import 'Screens/Parking.dart';
import 'Screens/SplashPage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'Screens/Cart.dart';
import 'Screens/cart_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

var appDir;
String email;
bool oneTime;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('emails');
  print(email);
  // if(email.contains('email'))
  // {
  //   oneTime=true;
  // }
  runApp(EasyLocalization(
    child: MyApp(),
    path: "resources/langs",
    saveLocale: true,
    supportedLocales: [
      Locale('en', 'EN'),
      Locale('bn', 'BN'),
    ],
  ));

  const fiveMinutes = const Duration(minutes: 5);
  new Timer(fiveMinutes, () => deleteCa());
}

deleteCa() async {
  appDir = (await getTemporaryDirectory()).path;
  new Directory(appDir).delete(recursive: true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Cart()),
        ],
        child: MaterialApp(
          initialRoute: email == null ? SplashPage.id : DashBoard.id,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            LoginPage.id: (context) => LoginPage(),
            // When navigating to the "/second" route, build the SecondScreen widget.
            SignUpPage.id: (context) => SignUpPage(),
            SplashPage.id: (context) => SplashPage(),
            LanguageSelect.id: (context) => LanguageSelect(),
            DashBoard.id: (context) => DashBoard(),
            ProductList.id: (context) => ProductList(),
            CinePlex.id: (context) => CinePlex(),
            AmusementScreen.id: (context) => AmusementScreen(),
            FoodCourt.id: (context) => FoodCourt(),
            Parking.id: (context) => Parking(),
            CartScreen.id: (context) => CartScreen()
          },
        ));
  }
}
