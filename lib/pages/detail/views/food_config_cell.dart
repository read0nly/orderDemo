import 'package:flutter/material.dart';
import 'package:order_emo/entities/food.dart';
import 'package:order_emo/res/my_colors.dart';

class FoodConfigCell extends StatefulWidget {
  final List<Food> foods;
  final int index;

  const FoodConfigCell({Key? key, this.foods = const [], this.index = 1})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _FoodConfigCellState();
}

class _FoodConfigCellState extends State<FoodConfigCell>
    with TickerProviderStateMixin {
  // 是否可以编辑，有多个食物选项就可以编辑
  late bool _needEdit;

  // 是否展开了编辑面板
  late bool _isOpenEditView;

  // 当前选中的事务，如果只有一个默认选择
  Food? _current;

  /// 展开编辑菜单的控制器控制器
  late AnimationController editAnimationController;
  late Animation<double> editAnimation;

  @override
  void initState() {
    _isOpenEditView = false;
    _needEdit = widget.foods.length > 1;
    if (!_needEdit) {
      _current = widget.foods.first;
    }

    editAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          setState(() => _isOpenEditView = false);
        } else {
          setState(() => _isOpenEditView = true);
        }
      });
    editAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: editAnimationController, curve: Curves.easeInOut));
    super.initState();
    if (_needEdit) {
      _isOpenEditView = true;
      editAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildIndexView(),
            const SizedBox(width: 10),
            Expanded(
                child: _ContentView(
              image: _current?.image,
              title: _needEdit ? "饮料" : _current?.name,
              subtitle: _needEdit ? _current?.name : "暂无选择",
            )),
            _ButtonView(
              canEdit: _needEdit,
              onClickEdit: () {
                _isOpenEditView = true;
                editAnimationController.forward();
              },
            ),
          ],
        ),
        _needEdit && _isOpenEditView
            ? _DrinksView(
                list: widget.foods,
                animation: editAnimation,
                onClickFood: (drink) {
                  editAnimationController.reverse();
                  setState(() {
                    _current = drink;
                  });
                },
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildIndexView() {
    return Text(
      "${widget.index}",
      style: const TextStyle(
          fontSize: 36, fontWeight: FontWeight.bold, color: MyColors.titleText),
    );
  }

  @override
  void dispose() {
    editAnimationController.dispose();
    super.dispose();
  }
}

class _ContentView extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subtitle;

  const _ContentView(
      {Key? key, this.image, this.title = '', this.subtitle = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          image == null
              ? Container(
                  width: 70,
                  height: 40,
                  color: MyColors.grayLine,
                )
              : Image.asset(image!, width: 70),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title ?? '',
                style: const TextStyle(
                    fontSize: 14,
                    color: MyColors.titleText,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
              Text(
                subtitle ?? '',
                style: const TextStyle(
                    fontSize: 12,
                    color: MyColors.grayText,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _ButtonView extends StatelessWidget {
  final bool canEdit;
  final VoidCallback? onClickEdit;
  final VoidCallback? onClickCheck;

  const _ButtonView(
      {Key? key, this.canEdit = false, this.onClickEdit, this.onClickCheck})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return canEdit
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildButton(
                title: "结账",
                bgColor: Colors.green,
                titleColor: Colors.white,
                onClick: onClickCheck,
              ),
              const SizedBox(height: 5),
              _buildButton(title: "修改", onClick: onClickEdit),
            ],
          )
        : _buildButton(
            title: "结账",
            bgColor: Colors.green,
            titleColor: Colors.white,
            onClick: onClickCheck,
          );
  }

  Widget _buildButton(
      {Color bgColor = MyColors.grayLine,
      String title = "修改",
      Color titleColor = MyColors.titleText,
      VoidCallback? onClick}) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 20,
        width: 50,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(2)),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(fontSize: 12, color: titleColor),
        ),
      ),
    );
  }
}

/// 显示饮料选择
class _DrinksView extends StatelessWidget {
  final Animation<double> animation;
  final List<Food> list;
  final Function(Food)? onClickFood;

  const _DrinksView(
      {Key? key, required this.list, this.onClickFood, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, childWidget) {
        return Container(
          width: double.infinity,
          height: 100,
          alignment: Alignment.topCenter,
          child: ClipRect(
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              widthFactor: 1.0,
              heightFactor: animation.value,
              child: SingleChildScrollView(child: childWidget),
            ),
          ),
        );
      },
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: list.map((food) {
              return _ScaleDrinkView(
                drink: food,
                onClick: () {
                  onClickFood?.call(food);
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

/// 显示饮料选择
class _ScaleDrinkView extends StatefulWidget {
  final Food drink;
  final VoidCallback? onClick;

  const _ScaleDrinkView({Key? key, required this.drink, this.onClick})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScaleDrinkViewState();
}

class _ScaleDrinkViewState extends State<_ScaleDrinkView>
    with TickerProviderStateMixin {
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
        child: Image.asset(widget.drink.image, width: 80),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
