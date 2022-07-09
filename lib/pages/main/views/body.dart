import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_emo/controllers/mainController.dart';
import 'package:order_emo/pages/main/views/category.dart';

import 'sku_view.dart';

class MainBody extends StatelessWidget {
  MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CategoryView(), flex: 1),
        Expanded(child: SkuView(

        ), flex: 4),
      ],
    );
  }
}
