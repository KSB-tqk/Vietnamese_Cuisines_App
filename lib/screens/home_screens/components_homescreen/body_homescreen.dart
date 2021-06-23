import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/notifier/food_notifier.dart';
import 'package:flutter_app_test/screens/home_screens/components_homescreen/food_item.dart';
import 'package:flutter_app_test/screens/home_screens/top10food/top10food.dart';
import 'package:flutter_app_test/screens/home_screens/three_side_food/widget/top_delicious_three_side.dart';
import 'package:provider/provider.dart';

class BodyHomeScreen extends StatefulWidget {
  const BodyHomeScreen({key}) : super(key: key);

  @override
  _BodyHomeScreenState createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    FoodNotifier topSouthFoodNotifier = Provider.of<FoodNotifier>(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // top 10 cuisines
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Top10Food(),
          ),
          // cuisines 3 side in Vietnam
          TopDeliciousThreeSide(),
          SizedBox(
            height: size.height * 0.03,
          ),
          // Recommend for you
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Món ăn cho bạn ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: topSouthFoodNotifier.southFoodList.length,
              itemBuilder: (BuildContext context, int index) {
                final i = topSouthFoodNotifier.southFoodList[index];
                return FoodItem(
                  food: i,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
