import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/notifier/food_notifier.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetailFood extends StatelessWidget {
  static String id = 'DetailFood';
  const DetailFood({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        shadowColor: kPrimaryColor,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text(
          foodNotifier.currentFood.name,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height * 0.2),
            padding: EdgeInsets.only(top: size.height * 0.2),
            height: size.height * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          foodNotifier.currentFood.location,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    SmoothStarRating(
                      borderColor: Colors.black12,
                      color: Colors.yellow,
                      rating: 5,
                      isReadOnly: true,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      "Giới thiệu món ăn",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      foodNotifier.currentFood.describe,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      "Nguyên liệu",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      foodNotifier.currentFood.ingredients,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Hero(
            tag: foodNotifier.currentFood.idFood,
            child: Image.network(
              foodNotifier.currentFood.image,
              // height: size.height * 0.4,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
