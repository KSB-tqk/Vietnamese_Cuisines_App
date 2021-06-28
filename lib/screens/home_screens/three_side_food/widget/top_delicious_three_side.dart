import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/notifier/food_notifier.dart';
import 'package:flutter_app_test/screens/home_screens/three_side_food/details_three_side_food/detail_middle_food.dart';
import 'package:flutter_app_test/screens/home_screens/three_side_food/details_three_side_food/detail_north_food.dart';
import 'package:flutter_app_test/screens/home_screens/three_side_food/details_three_side_food/detail_south_food.dart';
import 'package:flutter_app_test/screens/home_screens/three_side_food/widget/food_three_side_card.dart';
import 'package:provider/provider.dart';

class TopDeliciousThreeSide extends StatelessWidget {
  const TopDeliciousThreeSide({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final food = Provider.of<FoodNotifier>(context);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                "Món ngon ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              OutlinedButton(
                onPressed: null,
                child: Text(
                  "3 miền",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: kPrimaryColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FoodThreeSideCard(
                nameSide: "Ẩm thực miền Bắc",
                imageSide: "assets/images/top_mien_bac.png",
                numberOfFood: food.northFoodList.length,
                press: () {
                  Navigator.pushNamed(context, TopNorthFood.id);
                },
              ),
              FoodThreeSideCard(
                nameSide: "Ẩm thực miền Trung",
                imageSide: "assets/images/top_mien_trung.png",
                numberOfFood: food.middleFoodList.length,
                press: () {
                  Navigator.pushNamed(context, TopMiddleFood.id);
                },
              ),
              FoodThreeSideCard(
                nameSide: "Ẩm thực miền Nam",
                imageSide: "assets/images/top_mien_nam.png",
                numberOfFood: food.southFoodList.length,
                press: () {
                  Navigator.pushNamed(context, TopSouthFood.id);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
