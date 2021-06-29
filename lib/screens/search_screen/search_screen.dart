import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/notifier/food_notifier.dart';
import 'package:flutter_app_test/components/food.dart';
import 'package:flutter_app_test/screens/home_screens/components_homescreen/food_item.dart';
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
          title: Text("Kho ẩm thực".toUpperCase(),
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: Provider.of<FoodNotifier>(context)
                            .findFoodList
                            .length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final i = Provider.of<FoodNotifier>(context)
                              .findFoodList[index];
                          if (index == 0) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: 90,
                              ),
                              child: FoodItem(food: i),
                            );
                          }
                          return FoodItem(food: i);
                        }),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                border: Border.all(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(20),
              ),
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
                      Provider.of<FoodNotifier>(context, listen: false)
                          .searchForFood(searchTEC.text);
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
          ],
        ));
  }
}
