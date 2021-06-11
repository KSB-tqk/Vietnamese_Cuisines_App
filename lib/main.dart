import 'package:flutter/material.dart';
import 'package:flutter_app_test/screens/favorite_screen/favorite_screen.dart';
import 'package:flutter_app_test/screens/home_screens/home_main_screen.dart';
import 'package:flutter_app_test/screens/home_screens/home_screen.dart';
import 'package:flutter_app_test/screens/login/screens/login.dart';
import 'package:flutter_app_test/screens/search_screen/search_screen.dart';
import 'package:flutter_app_test/screens/splash/splash_screen.dart';
import 'package:flutter_app_test/screens/user_screen/user_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vietnamese Cuisines App',
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        HomeMainScreen.id: (context) => HomeMainScreen(), // details home screen
        LoginScreen.id: (context) => LoginScreen(),
        SearchScreen.id: (context) => SearchScreen(),
        FavoriteScreen.id: (context) => FavoriteScreen(),
        UserScreen.id: (context) => UserScreen(),
      },
      initialRoute: LoginScreen.id,
    );
  }
}
