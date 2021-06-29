import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/food.dart';
import 'package:flutter_app_test/components/middlefood.dart';
import 'package:flutter_app_test/components/northfood.dart';
import 'package:flutter_app_test/components/reccommend.dart';
import 'package:flutter_app_test/components/southfood.dart';
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
  //middle food
  MiddleFood middleFood;
  List<Food> middleFoodList = [];
  //south food
  SouthFood southFood;
  List<Food> southFoodList = [];
  //reccommend food
  ReccommendFood reccommendFood;
  List<Food> reccommendFoodList = [];

  //find food
  List<Food> findFoodList = [];

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
    this.foodList = foodList;
    findFoodList = foodList;
    // load toàn bộ data food có trên firebase xuống
    await getTopFood(foodNotifier);
    await getNorthFood(foodNotifier);
    await getMiddleFood(foodNotifier);
    await getSouthFood(foodNotifier);
    await getReccommendFood(foodNotifier);
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

  // Lấy danh sách các món ăn miền Bắc
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

  // Lấy danh sách các món ăn miền Trung
  getMiddleFood(FoodNotifier topMiddleFoodNotifer) async {
    var snapshot = await FirebaseFirestore.instance
        .collection('Food')
        .doc('MiddleFood')
        .get();

    middleFood = MiddleFood.fromJson(snapshot.data());
    middleFoodList = middleFood.listMiddleFood
        .map((e) =>
            _foodList.firstWhere((element) => element.idFood == e.toString()))
        .toList();
  }

  // Lấy danh sách các món miền Nam
  getSouthFood(FoodNotifier topSouthFoodNotifer) async {
    var snapshot = await FirebaseFirestore.instance
        .collection('Food')
        .doc('SouthFood')
        .get();
    southFood = SouthFood.fromJson(snapshot.data());
    southFoodList = southFood.listSouthFood
        .map((e) =>
            _foodList.firstWhere((element) => element.idFood == e.toString()))
        .toList();
  }

  // Lấy danh sách các món gợi ý
  getReccommendFood(FoodNotifier reccommendFoodNotifer) async {
    var snapshot = await FirebaseFirestore.instance
        .collection('Food')
        .doc('Reccommend')
        .get();
    reccommendFood = ReccommendFood.fromJson(snapshot.data());
    reccommendFoodList = reccommendFood.listReccommend
        .map((e) =>
            _foodList.firstWhere((element) => element.idFood == e.toString()))
        .toList();
  }

  //Tìm danh sách món ăn
  searchForFood(String query) {
    findFoodList =
        _foodList.where((element) => element.searchName.contains(query.toLowerCase())).toList();
    notifyListeners();
  }
}
