import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/screens/login/authentication/authentication.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  static String id = 'UserScreen';
  const UserScreen({key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthenticationService>(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          width: 200,
          height: 50,
          child: OutlinedButton(
            onPressed: () {
              loginProvider.signOut();
            },
            child: Text(
              "Đăng xuất",
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
        ),
      ),
    );
  }
}
