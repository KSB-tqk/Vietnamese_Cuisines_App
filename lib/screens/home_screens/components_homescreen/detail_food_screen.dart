import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/components/food.dart';
import 'package:flutter_app_test/notifier/authentication.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:like_button/like_button.dart';

class DetailFood extends StatelessWidget {
  static String id = 'DetailFood';
  const DetailFood({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Food food = (ModalRoute.of(context).settings.arguments as List)[0];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        shadowColor: kPrimaryColor,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text(
          food.name,
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
      body: SingleChildScrollView(
        child: Stack(
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
              child: Padding(
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
                            width: size.width * 0.01,
                          ),
                          Text(
                            food.location,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothStarRating(
                            borderColor: Colors.black12,
                            color: Colors.yellow,
                            rating: 5,
                            isReadOnly: true,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: LikeButton(
                              isLiked: Provider.of<AuthenticationService>(
                                context,
                              ).favoriteFood.listIdFood.contains(food.idFood),
                              likeBuilder: (bool isLiked) {
                                return Icon(
                                  Icons.favorite,
                                  color:
                                      isLiked ? Colors.red[600] : Colors.grey,
                                );
                              },
                              onTap: (bool) =>
                                  onClickFavorFood(bool, context, food.idFood),
                            ),
                          ),
                        ],
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
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          food.describe,
                          style: TextStyle(
                            fontSize: 15,
                          ),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          food.ingredients.replaceAll(". ", '\n'),
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Hero(
              tag: food.idFood,
              child: Image.network(
                food.image,
                // height: size.height * 0.4,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Thêm món ăn yêu thích
  Future<bool> onClickFavorFood(
      bool isLove, BuildContext context, String idFood) async {
    final favFood = Provider.of<AuthenticationService>(context, listen: false);
    if (!isLove) {
      favFood.updateFavorite(idFood);
    } else {
      favFood.deleteFavorite(idFood);
    }
    return !isLove;
  }
}
