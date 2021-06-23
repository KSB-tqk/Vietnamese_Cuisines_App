import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/main.dart';

class Body extends StatefulWidget {
  const Body({key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "textTitle": "Ẩm thực Việt Nam",
      "textSplash": "Chào mừng đến với ẩm thực Việt Nam!",
      "imageSplash": "assets/images/splash_screen_1.png",
    },
    {
      "textTitle": "Tinh hoa ẩm thực Việt",
      "textSplash": "Các công thức chế biến món ngon",
      "imageSplash": "assets/images/splash_screen_2.png",
    },
    {
      "textSplash": "Mang ẩm thực Việt đến bếp nhà bạn",
      "textTitle": "Món ngon của bạn",
      "imageSplash": "assets/images/splash_screen_3.png",
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
                        textTitle: splashData[index]["textTitle"],
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
                              onPressed: () async {
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
    this.textTitle,
  }) : super(key: key);
  final String textSplash, imageSplash, textTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          textTitle,
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
