import 'package:flutter/material.dart';
import 'package:flutter_app_test/screens/home_screens/components_homescreen/top10food.dart';
import 'package:flutter_app_test/screens/home_screens/components_homescreen/top_delicious_three_side.dart';

class BodyHomeScreen extends StatefulWidget {
  const BodyHomeScreen({key}) : super(key: key);

  @override
  _BodyHomeScreenState createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCCCCC),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: TopFood(),
              ),
            ),
            Expanded(
              child: TopDeliciousThreeSide(),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
