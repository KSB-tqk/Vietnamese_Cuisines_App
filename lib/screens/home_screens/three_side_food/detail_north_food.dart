import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/notifier/food_notifier.dart';
import 'package:flutter_app_test/screens/home_screens/three_side_food/widgets/food_item.dart';
import 'package:provider/provider.dart';

class TopNorthFood extends StatelessWidget {
  static String id = 'NorthFood';
  const TopNorthFood({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodNotifier topNorthFoodNotifier = Provider.of<FoodNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          'Ẩm thực miền Bắc!',
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
        child: ListView.builder(
          itemCount: topNorthFoodNotifier.northFoodList.length,
          itemBuilder: (BuildContext context, int index) {
            final i = topNorthFoodNotifier.northFoodList[index];
            return FoodItem(
              food: i,
            );
          },
        ),
      ),
    );
  }
}
