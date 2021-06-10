import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/screens/home_screens/components_homescreen/body_homescreen.dart';
import 'package:flutter_svg/svg.dart';

class HomeMainScreen extends StatefulWidget {
  static String id = 'HomeMainScreen';
  const HomeMainScreen({key}) : super(key: key);

  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  final Widget svgIcon = SvgPicture.asset(
    "assets/icons/chef.svg",
    color: kPrimaryColor,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: 20),
          onPressed: null,
          icon: svgIcon,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: "Vietnames",
                  style: TextStyle(color: Color(0xFFFE842D))),
              TextSpan(text: "Cuisines", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
      body: BodyHomeScreen(),
    );
  }
}
