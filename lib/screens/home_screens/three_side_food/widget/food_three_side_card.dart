import 'package:flutter/material.dart';

class FoodThreeSideCard extends StatelessWidget {
  final String nameSide, imageSide;
  final int numberOfFood;
  final GestureTapCallback press;

  const FoodThreeSideCard({
    Key key,
    this.nameSide,
    this.imageSide,
    this.numberOfFood,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: InkWell(
        onTap: press,
        child: SizedBox(
          width: 242,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  imageSide,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF525559).withOpacity(0.6),
                        Color(0xFF525559).withOpacity(0.3),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, right: 10, left: 10, bottom: 10),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$nameSide\n",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "$numberOfFood món",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
