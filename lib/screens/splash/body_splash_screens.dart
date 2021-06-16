import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/main.dart';
import 'package:flutter_app_test/screens/login/screens/login.dart';

class Body extends StatefulWidget {
  const Body({key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "textSplash": "Chào mừng đến với ẩm thực Việt Nam!",
      "imageSplash": "assets/images/splash_screen_1.png",
    },
    {
      "textSplash": "Tinh hoa ẩm thực Việt Nam - Món ngon nước Việt",
      "imageSplash": "assets/images/splash_screen_1.png",
    },
    {
      "textSplash": "Mang ẩm thực Việt Nam đến mọi người!",
      "imageSplash": "assets/images/splash_screen_1.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: kPrimaryColor,
        height: size.height,
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemCount: splashData.length,
                      itemBuilder: (context, index) => SplashContent(
                        imageSplash: splashData[index]["imageSplash"],
                        textSplash: splashData[index]["textSplash"],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              splashData.length,
                              (index) => buildDot(index: index),
                            ),
                          ),
                          Spacer(flex: 3),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AuthenticationWrapper.id);
                              },
                              child: Text(
                                "Bắt đầu nào!",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 20,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.white : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.textSplash,
    this.imageSplash,
  }) : super(key: key);
  final String textSplash, imageSplash;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "Vietnamese Cuisines",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          textSplash,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontStyle: FontStyle.italic,
          ),
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          imageSplash,
          height: 320,
        ),
      ],
    );
  }
}
