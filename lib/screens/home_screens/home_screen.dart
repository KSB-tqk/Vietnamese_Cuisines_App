import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/screens/favorite_screen/favorite_screen.dart';
import 'package:flutter_app_test/screens/home_screens/home_main_screen.dart';
import 'package:flutter_app_test/screens/search_screen/search_screen.dart';
import 'package:flutter_app_test/screens/user_screen/user_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';
  const HomeScreen({key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  //list Page
  List listOfPage = [
    HomeMainScreen(),
    SearchScreen(),
    FavoriteScreen(),
    UserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfPage[currentIndex],
      bottomNavigationBar: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 20,
          top: 10,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavyBar(
            curve: Curves.decelerate,
            backgroundColor: Color(0xFFFE824D),
            selectedIndex: currentIndex,
            onItemSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Center(
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                activeColor: Colors.white,
                inactiveColor: Colors.black54,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.search),
                title: Center(
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                activeColor: Colors.white,
                inactiveColor: Colors.black54,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.favorite),
                title: Center(
                  child: Text(
                    'Favorite',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                activeColor: Colors.white,
                inactiveColor: Colors.black54,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.account_circle),
                title: Center(
                  child: Text(
                    'User',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                activeColor: Colors.white,
                inactiveColor: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
