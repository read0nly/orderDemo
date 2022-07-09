import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_emo/pages/main/views/banner.dart';
import 'package:order_emo/pages/main/views/body.dart';

import '../../controllers/mainController.dart';
import '../../widgets/back_btn.dart';
import '../../widgets/my_app_bar.dart';

class MainPage extends StatelessWidget {
  final mainController = Get.put(MainController());

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BannerView(),
          const MyAppBar(leading: BackBtn(), title: "菜单"),
          Expanded(child: MainBody()),
        ],
      ),
    );
  }
}
