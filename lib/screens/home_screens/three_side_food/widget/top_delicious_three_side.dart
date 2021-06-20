import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/screens/home_screens/three_side_food/details_three_side_food/detail_middle_food.dart';
import 'package:flutter_app_test/screens/home_screens/three_side_food/details_three_side_food/detail_north_food.dart';
import 'package:flutter_app_test/screens/home_screens/three_side_food/widget/food_three_side_card.dart';

class TopDeliciousThreeSide extends StatelessWidget {
  const TopDeliciousThreeSide({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                numberOfFood: 10,
                press: () {
                  Navigator.pushNamed(context, TopNorthFood.id);
                },
              ),
              FoodThreeSideCard(
                nameSide: "Ẩm thực miền Trung",
                imageSide: "assets/images/top_mien_trung.png",
                numberOfFood: 10,
                press: () {
                  Navigator.pushNamed(context, TopMiddleFood.id);
                },
              ),
              FoodThreeSideCard(
                nameSide: "Ẩm thực miền Nam",
                imageSide: "assets/images/top_mien_nam.png",
                numberOfFood: 10,
                press: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
