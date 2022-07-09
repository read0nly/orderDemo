import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_emo/entities/meal.dart';

import '../../widgets/back_btn.dart';
import '../../widgets/my_app_bar.dart';
import 'views/bottom_bar.dart';
import 'views/meal_config_view.dart';
import 'views/number_control_view.dart';

class DetailPage extends StatelessWidget {
  final Meal meal;

  const DetailPage({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            MyAppBar(leading: BackBtn(onClick: () => Get.back()), title: "餐品"),
            Expanded(child: MealConfigView(meal: meal)),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
