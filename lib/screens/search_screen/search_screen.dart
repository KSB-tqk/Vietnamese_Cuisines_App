import 'package:flutter/material.dart';
import 'package:flutter_app_test/notifier/food_notifier.dart';
import 'package:like_button/like_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/components/food.dart';
import 'package:flutter_app_test/screens/home_screens/components_homescreen/food_item.dart';
import 'package:flutter_app_test/notifier/authentication.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'SearchScreen';
  const SearchScreen({key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTEC = new TextEditingController();
  List<Food> foodListFound = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Search".toUpperCase(),
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                            controller: searchTEC,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: "Tìm kiếm món ăn theo tên.",
                                hintStyle: TextStyle(color: Colors.white54),
                                border: InputBorder.none),
                          )),
                      GestureDetector(
                        onTap: () {
                          Provider.of<FoodNotifier>(context, listen: false).searchForFood(searchTEC.text);
                        },
                        child: Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  const Color(0x36FFFFFF),
                                  const Color(0x0FFFFFFF)
                                ]),
                                borderRadius: BorderRadius.circular(40)),
                            child: Image.asset("assets/images/search_icon.png")),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: ListView.builder(
                      itemCount: Provider.of<FoodNotifier>(context).findFoodList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final i = Provider.of<FoodNotifier>(context).findFoodList[index];
                        return FoodItem(food: i);
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
