import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';

class TopFood extends StatefulWidget {
  const TopFood({key}) : super(key: key);

  @override
  _TopFoodState createState() => _TopFoodState();
}

class _TopFoodState extends State<TopFood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 166,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/image_header.png"),
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                "Top 10 món ngon Việt Nam",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Tận hưởng hương vị ẩm thực Việt Nam",
                style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Khám phá ngay!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
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
            ],
          ),
        ),
      ),
    );
  }
}
