import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/notifier/comment_notifer.dart';
import 'package:flutter_app_test/notifier/food_notifier.dart';
import 'package:flutter_app_test/notifier/home_screen_notifier.dart';
import 'package:flutter_app_test/screens/favorite_screen/favorite_screen.dart';
import 'package:flutter_app_test/screens/home_screens/components_homescreen/detail_food_screen.dart';
import 'package:flutter_app_test/screens/home_screens/screens/home_main_screen.dart';
import 'package:flutter_app_test/screens/home_screens/screens/home_screen.dart';
import 'package:flutter_app_test/screens/home_screens/three_side_food/details_three_side_food/detail_middle_food.dart';
import 'package:flutter_app_test/screens/home_screens/three_side_food/details_three_side_food/detail_north_food.dart';
import 'package:flutter_app_test/screens/home_screens/three_side_food/details_three_side_food/detail_south_food.dart';
import 'package:flutter_app_test/screens/home_screens/top10food/details_top_ten_foods.dart';
import 'package:flutter_app_test/notifier/authentication.dart';
import 'package:flutter_app_test/screens/login/screens/login.dart';
import 'package:flutter_app_test/screens/search_screen/search_screen.dart';
import 'package:flutter_app_test/screens/splash/splash_screen.dart';
import 'package:flutter_app_test/screens/user_screen/user_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // bool check = prefs.getBool('checkAppInstalled') ?? true;
  // await prefs.setBool('checkAppInstalled', true);
  runApp(MyApp(
      // check: check,
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // final bool check;

  // const MyApp({Key key, this.check}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationService>(
            create: (context) => AuthenticationService(FirebaseAuth.instance)),
        ChangeNotifierProvider(
          create: (context) => FoodNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FoodComment(),
        ),
      ],
      child: MaterialApp(
        title: 'Vietnamese Cuisines App',
        debugShowCheckedModeBanner: false,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          HomeMainScreen.id: (context) =>
              HomeMainScreen(), // details home screen
          LoginScreen.id: (context) => LoginScreen(),
          SearchScreen.id: (context) => SearchScreen(),
          FavoriteScreen.id: (context) => FavoriteScreen(),
          UserScreen.id: (context) => UserScreen(),
          AuthenticationWrapper.id: (context) => AuthenticationWrapper(),
          DetailsTopFood.id: (context) =>
              DetailsTopFood(), // details top 10 food
          DetailFood.id: (context) => DetailFood(),
          TopNorthFood.id: (context) =>
              TopNorthFood(), // details top north food
          TopMiddleFood.id: (context) =>
              TopMiddleFood(), // details top middle food
          TopSouthFood.id: (context) =>
              TopSouthFood(), // details top south food
        },
        initialRoute: SplashScreen.id,
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  static String id = 'AuthenticationWrapper';
  const AuthenticationWrapper({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catchAuth = Provider.of<AuthenticationService>(context);
    return StreamBuilder(
      stream: catchAuth.authStateChange,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Scaffold(
              body: Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SpinKitCircle(
                        itemBuilder: (context, index) => DecoratedBox(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Chờ tí nha!'),
                    ],
                  ),
                ),
              ),
            );
            break;
          default:
            if (!snapshot.hasData)
              return LoginScreen();
            else {
              return FutureBuilder(
                future: catchAuth.setUpUserFirestore(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      return HomeScreen();
                      break;
                    default:
                      return Scaffold(
                        body: Center(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SpinKitCircle(
                                  itemBuilder: (context, index) => DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Đợi tí nha!',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                  }
                },
              );
            }
        }
      },
    );
  }
}
