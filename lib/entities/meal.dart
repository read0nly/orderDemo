// 套餐类

import '../entities/food.dart';

class Meal {
  final Food main;
  List<Food> drinks;
  final String title;
  final double price;
  final double deliverFee;

  Meal({
    required this.main,
    this.drinks = const [],
    required this.title,
    this.price = 0,
    this.deliverFee = 0,
  });
}
