// 食物类
class Food {
  final String id;
  final String name;
  final String image;
  final double price;

  // 0 ：主食  1：饮料
  final int type;

  Food({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.type = 0,
  });
}

extension on Food {}
