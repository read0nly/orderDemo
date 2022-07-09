import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:order_emo/entities/food.dart';
import 'package:order_emo/entities/meal.dart';

import '../entities/category.dart';

class MainController extends GetxController {
  // 产品大分类列表数据
  final categories = <Category>[].obs;

  // 单签选中的大分类的索引
  final selectedCategoryIndex = 0.obs;

  // 用于控制分类列表滚动的ScrollController
  final categoryScrollController = ScrollController();

  final meals = <Meal>[].obs;

  @override
  void onReady() {
    super.onReady();

    /// 生成测试用的分类列表数据
    List<Category> samples = List.generate(
        20,
        (index) => Category(
            id: "$index",
            name: "大类$index",
            icon: "assets/images/category.png"));
    categories.assignAll(samples);

    /// 生成饮料测试用例
    final cola = Food(
        id: "1", name: "可乐", image: "assets/images/foods/cola.png", price: 1);
    final juice = Food(
        id: "2", name: "橙汁", image: "assets/images/foods/juice.png", price: 1);

    /// 生成测试用的套餐数据
    List<Meal> mealsSamples = List.generate(
        20,
        (index) => Meal(
            main: Food(
                id: "201920301293",
                name: "测试食物1",
                image: "assets/images/foods/foods${index % 5}.png",
                price: 10),
            title: "测试套餐$index",
            price: 12,
            deliverFee: 1.2,
            drinks: [cola, juice]));
    meals.assignAll(mealsSamples);
  }

  @override
  void onClose() {
    categoryScrollController.dispose();
    super.onClose();
  }
}
