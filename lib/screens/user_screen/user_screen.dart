import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  static String id = 'UserScreen';
  const UserScreen({key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}
