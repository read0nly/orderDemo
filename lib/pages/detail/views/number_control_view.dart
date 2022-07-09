import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:order_emo/res/my_colors.dart';

class NumberControlView extends StatelessWidget {
  const NumberControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          _CircleButton(title: "-"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "1",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MyColors.titleText),
            ),
          ),
          _CircleButton(title: "+", titleColor: Colors.white),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final VoidCallback? onClick;
  final Color backgroundColor;

  const _CircleButton(
      {Key? key,
      this.title = '',
      this.titleColor = MyColors.titleText,
      this.backgroundColor = Colors.green,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: backgroundColor,
      ),
      alignment: Alignment.center,
      child: AutoSizeText(
        title,
        style: TextStyle(fontSize: 24, color: titleColor),
      ),
    );
  }
}
