import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_emo/entities/category.dart';
import 'package:order_emo/res/my_colors.dart';

import '../../../controllers/mainController.dart';

class CategoryView extends StatelessWidget {
  final controller = Get.find<MainController>();

  CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => ListView.builder(
            padding: const EdgeInsets.all(0),
            controller: controller.categoryScrollController,
            itemBuilder: (context, index) => Obx(
              () => CategoryItem(
                category: controller.categories[index],
                isSelected: controller.selectedCategoryIndex.value == index,
                onClick: () {
                  controller.selectedCategoryIndex.value = index;
                },
              ),
            ),
            itemCount: controller.categories.length,
          ),
        ),
        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.white.withOpacity(0.6),
                  Colors.transparent,
                  Colors.white.withOpacity(0.6),
                ])),
          ),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final Category category;
  final VoidCallback? onClick;

  const CategoryItem(
      {Key? key, required this.category, this.isSelected = true, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick?.call();
      },
      child: Container(
        color: isSelected ?  MyColors.grayLine : Colors.white,
        height: 100,
        child: Row(
          children: [
            Container(
              width: 4,
              height: 60,
              decoration: BoxDecoration(
                  color: isSelected ? Colors.green : Colors.white,
                  borderRadius: BorderRadius.circular(1)),
            ),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(category.icon, width: 50, height: 50),
                const SizedBox(height: 5),
                Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: MyColors.titleText,
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
