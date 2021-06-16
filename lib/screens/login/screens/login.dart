import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/screens/login/authentication/authentication.dart';
import 'package:flutter_app_test/screens/login/authentication/login_details.dart';
import 'package:flutter_app_test/screens/login/authentication/signup_details.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';
  const LoginScreen({key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignUpScreen = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final checkUser = Provider.of<AuthenticationService>(context);
    return FutureBuilder(
      future: checkUser.setUpUserFirestore(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Container(
                  height: size.height,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/splash_screen_1.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 90,
                              left: 20,
                            ),
                            color: kPrimaryColor.withOpacity(.75),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "Welcome",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: isSignUpScreen
                                            ? " to AppName,"
                                            : " Back",
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  isSignUpScreen
                                      ? "Đăng ký tài khoản để trải nghiệm!"
                                      : "Đăng nhập để vào nào!",
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 200,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: 400,
                          width: MediaQuery.of(context).size.width - 40,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 15,
                                    spreadRadius: 5),
                              ]),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSignUpScreen = false;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "Đăng nhập",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: !isSignUpScreen
                                                ? Colors.black
                                                : Colors.black12,
                                          ),
                                        ),
                                        if (!isSignUpScreen)
                                          Container(
                                            margin: EdgeInsets.only(top: 3),
                                            height: 2,
                                            width: 55,
                                            color: kPrimaryColor,
                                          ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSignUpScreen = true;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "Đăng ký",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: isSignUpScreen
                                                ? Colors.black
                                                : Colors.black12,
                                          ),
                                        ),
                                        if (isSignUpScreen)
                                          Container(
                                            margin: EdgeInsets.only(top: 3),
                                            height: 2,
                                            width: 55,
                                            color: kPrimaryColor,
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              if (isSignUpScreen) SignUpDetail(),
                              if (!isSignUpScreen) LoginDetail(),
                            ],
                          ),
                        ),
                      ),
                      // button login by social media
                      Positioned(
                        top: MediaQuery.of(context).size.height - 150,
                        right: 0,
                        left: 0,
                        child: Column(
                          children: [
                            Text(
                              "Hoặc đăng nhập bằng",
                              style: TextStyle(
                                color: Colors.black26,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(right: 20, left: 20, top: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildTextButtonSocial(
                                      iconData: Icons.facebook,
                                      title: "Facebook",
                                      backgroundColor: Color(0xFF4267B2),
                                      press: () {}),
                                  buildTextButtonSocial(
                                      iconData: Icons.facebook_rounded,
                                      title: "Google",
                                      backgroundColor: Color(0xFFEA4335),
                                      press: () {}),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
            break;
          default:
            return Center(
              child: Container(),
            );
        }
      },
    );
  }

// Login bằng facebook, google
  TextButton buildTextButtonSocial(
      {IconData iconData,
      String title,
      Color backgroundColor,
      GestureTapCallback press}) {
    return TextButton(
      onPressed: press,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        primary: Colors.white,
        minimumSize: Size(155, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: BorderSide(width: 1, color: Colors.grey),
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }
}
