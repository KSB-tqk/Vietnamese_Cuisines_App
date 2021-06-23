import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/food.dart';
import 'package:flutter_app_test/screens/home_screens/components_homescreen/detail_food_screen.dart';

class FoodItem extends StatelessWidget {
  final Food food;

  const FoodItem({Key key, @required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.width * 0.25,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: ListTile(
              leading: SizedBox.fromSize(
                size: Size(80, 90),
                child: Hero(
                  tag: food.idFood,
                  child: Image.network(
                    food.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              title: Text(
                food.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                food.location,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 12,
              ),
              //on click detail food
              onTap: () => Navigator.pushNamed(context, DetailFood.id,
                  arguments: [food]),
            ),
          ),
        ),
      ),
    );
  }
}
