import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/notifier/food_notifier.dart';
import 'package:flutter_app_test/notifier/home_screen_notifier.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';
  const HomeScreen({key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    FoodNotifier topFoodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);
    topFoodNotifier.getFoods(topFoodNotifier);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    HomeScreenProvider homeScreenProvider =
        Provider.of<HomeScreenProvider>(context);
    return Scaffold(
      body: homeScreenProvider.listOfPage[homeScreenProvider.currentIndex],
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
            backgroundColor: kPrimaryColor,
            selectedIndex: homeScreenProvider.currentIndex,
            onItemSelected: (index) {
              homeScreenProvider.setPage = (index);
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Center(
                  child: Text(
                    'Trang chủ',
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
                    'Tìm kiếm',
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
                    'Yêu thích',
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
                    'Tài khoản',
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
