import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/notifier/food_notifier.dart';
import 'package:flutter_app_test/screens/home_screens/components_homescreen/detail_food_screen.dart';
import 'package:provider/provider.dart';

class DetailsTopFood extends StatefulWidget {
  static String id = 'DetailsTopFood';
  const DetailsTopFood({key}) : super(key: key);

  @override
  _DetailsTopFoodState createState() => _DetailsTopFoodState();
}

class _DetailsTopFoodState extends State<DetailsTopFood> {
  @override
  Widget build(BuildContext context) {
    FoodNotifier topFoodNotifier = Provider.of<FoodNotifier>(context);
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
          'Top 10 món ăn Việt Nam!',
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
        child: ListView.builder(
          itemCount: topFoodNotifier.topFoodList.length,
          itemBuilder: (BuildContext context, int index) {
            final i = topFoodNotifier.topFoodList[index];
            return Container(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            i.image,
                          ),
                        ),
                      ),
                      width: 110,
                    ),
                    title: Text(
                      i.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      i.location,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 12,
                    ),
                    //on click detail food
                    onTap: () {
                      topFoodNotifier.currentFood =
                          topFoodNotifier.topFoodList[index];
                      Navigator.pushNamed(context, DetailFood.id);
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
