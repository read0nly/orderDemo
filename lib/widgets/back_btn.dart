import 'package:flutter/material.dart';
import 'package:order_emo/res/my_colors.dart';

class BackBtn extends StatelessWidget {
  final VoidCallback? onClick;

  const BackBtn({Key? key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick?.call(),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Row(
          children: [
            Image.asset("assets/images/back.png", width: 24, height: 24),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "返回",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: MyColors.titleText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
