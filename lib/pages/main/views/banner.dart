import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class BannerView extends StatelessWidget {
  final List<String> banners = [
    'assets/images/banners/banner01.jpeg',
    'assets/images/banners/banner02.jpeg',
    'assets/images/banners/banner03.jpeg',
  ];

  BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Swiper(
        autoplay: true,
        autoplayDisableOnInteraction: true,
        autoplayDelay: 10000,
        itemCount: banners.length,
        itemBuilder: (c, i) => Image.asset(
          banners[i],
          width: double.infinity,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
