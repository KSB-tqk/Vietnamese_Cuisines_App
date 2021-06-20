import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'SearchScreen';
  const SearchScreen({key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
