import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/screens/home_screens/top10food/top10food.dart';
import 'package:flutter_app_test/screens/home_screens/three_side_food/top_delicious_three_side.dart';

class BodyHomeScreen extends StatefulWidget {
  const BodyHomeScreen({key}) : super(key: key);

  @override
  _BodyHomeScreenState createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Ẩm thực cho bạn ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
