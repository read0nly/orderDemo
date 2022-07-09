import 'package:flutter/material.dart';
import 'package:order_emo/entities/food.dart';
import 'package:order_emo/entities/meal.dart';
import 'package:order_emo/res/my_colors.dart';

import 'food_config_cell.dart';
import 'number_control_view.dart';

class MealConfigView extends StatelessWidget {
  final Meal meal;

  const MealConfigView({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 15, right: 15),
      children: [
        _buildHeadView(),
        const SizedBox(height: 20),
        _buildDeliverDetailView(),
        const SizedBox(height: 20),
        _buildListTitleView(),
        FoodConfigCell(index: 1, foods: [meal.main]),
        const SizedBox(height: 20),
        FoodConfigCell(index: 2, foods: meal.drinks),
        const SizedBox(height: 20),
        const NumberControlView(),
      ],
    );
  }

  Widget _buildHeadView() {
    return Row(
      children: [
        Image.asset(meal.main.image, width: 100),
        const SizedBox(width: 10),
        Expanded(
            child: Text(
          meal.title,
          style: const TextStyle(
              fontSize: 16,
              color: MyColors.titleText,
              fontWeight: FontWeight.w500),
        )),
        const SizedBox(width: 10),
        Text.rich(
          TextSpan(children: [
            const TextSpan(
              text: "€",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: MyColors.titleText,
              ),
            ),
            TextSpan(
              text: meal.price.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: MyColors.titleText,
              ),
            )
          ]),
        ),
      ],
    );
  }

  Widget _buildDeliverDetailView() {
    return Row(
      children: [
        Image.asset("assets/images/package.png", width: 20),
        const SizedBox(width: 5),
        const Expanded(
            child: Text(
          "打包费用",
          style: TextStyle(
              fontSize: 15,
              color: MyColors.titleText,
              fontWeight: FontWeight.w500),
        )),
        const SizedBox(width: 10),
        Text.rich(
          TextSpan(children: [
            const TextSpan(
              text: "€",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: MyColors.titleText,
              ),
            ),
            TextSpan(
              text: meal.price.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: MyColors.titleText,
              ),
            )
          ]),
        ),
      ],
    );
  }

  Widget _buildListTitleView() {
    return Row(
      children: [
        Container(
          height: 18,
          width: 5,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 5),
        const Text(
          "包含",
          style: TextStyle(
              fontSize: 15,
              color: MyColors.titleText,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
