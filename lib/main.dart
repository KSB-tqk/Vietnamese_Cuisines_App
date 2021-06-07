import 'package:flutter/material.dart';
import 'package:flutter_app_test/screens/home_screens/home_screen.dart';
import 'package:flutter_app_test/screens/login/screens/login.dart';
import 'package:flutter_app_test/screens/splash/splash_screen.dart';

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
        LoginScreen.id: (context) => LoginScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}

