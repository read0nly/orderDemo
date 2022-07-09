import 'package:flutter/material.dart';
import 'package:order_emo/res/my_colors.dart';

class MyAppBar extends StatelessWidget {
  final Widget? leading;
  final String title;
  final Widget? tail;

  const MyAppBar({Key? key, this.leading, this.title = '', this.tail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leading ?? const SizedBox.shrink(),
          Expanded(
              child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: MyColors.titleText,
              ),
            ),
          )),
          tail ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
