import 'package:flutter/material.dart';
import 'package:order_emo/res/my_colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => debugPrint("click"),
              child: Container(
                color: MyColors.grayLine,
                alignment: Alignment.center,
                child: const Text("取消",
                    style: TextStyle(fontSize: 14, color: MyColors.grayText)),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => debugPrint("click"),
              child: Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text("添加",
                    style: TextStyle(fontSize: 14, color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
