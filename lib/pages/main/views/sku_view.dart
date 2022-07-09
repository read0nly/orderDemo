import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_emo/entities/food.dart';
import 'package:order_emo/entities/meal.dart';
import 'package:order_emo/pages/detail/detail_page.dart';
import 'package:order_emo/res/my_colors.dart';

import '../../../controllers/mainController.dart';

class SkuView extends StatelessWidget {
  final controller = Get.find<MainController>();

  SkuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.builder(
          padding: const EdgeInsets.all(0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          scrollDirection: Axis.vertical,
          itemCount: controller.meals.length,
          itemBuilder: (context, index) {
            return SkuCell(
              meal: controller.meals[index],
              onClick: () {
                // 跳转到详情页面
                Get.to(() => DetailPage(meal: controller.meals[index]));
              },
            );
          },
        ));
  }
}

class SkuCell extends StatefulWidget {
  final Meal meal;

  final VoidCallback? onClick;

  const SkuCell({Key? key, required this.meal, this.onClick}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SkuCellState();
}

class SkuCellState extends State<SkuCell> with TickerProviderStateMixin {
  // 点击商品视图后缩放动画的控制器
  late AnimationController controller;

  // 点击商品视图后缩放动画的动画
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    // 初始化动画
    controller = AnimationController(
        duration: const Duration(milliseconds: 120), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          // 执行完缩和放动画后执行点击回调
          widget.onClick?.call();
        }
      });

    animation = Tween<double>(begin: 1.0, end: 0.9).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: GestureDetector(
        onTap: () {
          controller.forward();
        },
        child: Column(
          children: [
            Expanded(
              child: Image.asset(widget.meal.main.image),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  widget.meal.title,
                  minFontSize: 6,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: MyColors.titleText,
                  ),
                ),
                AutoSizeText.rich(
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
                      text: widget.meal.price.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: MyColors.titleText,
                      ),
                    )
                  ]),
                  minFontSize: 8,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
