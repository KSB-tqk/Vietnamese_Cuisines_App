import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/food.dart';
import 'package:flutter_app_test/components/northfood.dart';
import 'package:flutter_app_test/components/topfood.dart';

class FoodNotifier with ChangeNotifier {
  List<Food> _foodList = []; // danh sach food
  Food _currentFood;
  //top food
  TopFood topFood;
  List<Food> topFoodList = [];
  //north food
  NorthFood northFood;
  List<Food> northFoodList = [];

  UnmodifiableListView<Food> get foodList => UnmodifiableListView(_foodList);

  Food get currentFood => _currentFood;

  set foodList(List<Food> foodList) {
    _foodList = foodList;
    notifyListeners();
  }

  set currentFood(Food food) {
    _currentFood = food;
    notifyListeners();
  }

  getFoods(FoodNotifier foodNotifier) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Food')
        .doc('Foods')
        .collection('FoodInfo')
        .get();

    List<Food> foodList = [];

    snapshot.docs.forEach((docs) {
      Food food = Food.fromJson(docs.data());
      foodList.add(food);
    });

    // xóa dữ liệu khi load lại
    _foodList = foodList;
    foodNotifier.foodList = _foodList;

    getTopFood(foodNotifier);
    getNorthFood(foodNotifier);
    notifyListeners();
  }

  set topList(List<Food> topList) {
    topFoodList = topList;
    notifyListeners();
  }

  getTopFood(FoodNotifier topFoodNotifer) async {
    var snapshot = await FirebaseFirestore.instance
        .collection('Food')
        .doc('TopFood')
        .get();

    topFood = TopFood.fromJson(snapshot.data());
    topFoodList = topFood.listTopFood
        .map((e) =>
            _foodList.firstWhere((element) => element.idFood == e.toString()))
        .toList();
  }

  getNorthFood(FoodNotifier topNorthFoodNotifer) async {
    var snapshot = await FirebaseFirestore.instance
        .collection('Food')
        .doc('NorthFood')
        .get();

    northFood = NorthFood.fromJson(snapshot.data());
    northFoodList = northFood.listNorthFood
        .map((e) =>
            _foodList.firstWhere((element) => element.idFood == e.toString()))
        .toList();
  }
}
