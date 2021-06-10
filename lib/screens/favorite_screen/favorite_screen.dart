import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  static String id = 'FavoriteScreen';
  const FavoriteScreen({key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
    );
  }
}
