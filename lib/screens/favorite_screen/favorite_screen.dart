import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/components/food.dart';
import 'package:flutter_app_test/notifier/authentication.dart';
import 'package:flutter_app_test/screens/home_screens/components_homescreen/food_item.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  static String id = 'FavoriteScreen';
  const FavoriteScreen({key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteFood = Provider.of<AuthenticationService>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: 20),
          onPressed: null,
          icon: Icon(
            Icons.favorite,
            color: Colors.red[600],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              padding: EdgeInsets.only(left: 20),
              onPressed: null,
              icon: Icon(
                Icons.favorite,
                color: Colors.red[600],
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Ẩm thực của bạn',
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
        child: FutureBuilder<List<Food>>(
            future: favoriteFood.getListFoodFavorite(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done ||
                  !snapshot.hasData) {
                return Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Danh sách món ăn yêu thích của bạn trốnng!',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Hãy tìm các món ăn yêu thích!',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              List<Food> listFavoriteFood = snapshot.data;
              return ListView.builder(
                itemCount: listFavoriteFood.length,
                itemBuilder: (BuildContext context, int index) {
                  final i = listFavoriteFood[index];
                  return FoodItem(food: i);
                },
              );
            }),
      ),
    );
  }
}
