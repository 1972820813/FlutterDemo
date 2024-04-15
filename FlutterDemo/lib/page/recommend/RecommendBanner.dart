import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class RecommendBanner extends StatefulWidget {
  const RecommendBanner({super.key});

  @override
  State<RecommendBanner> createState() => _RecommendBanner();
}

class _RecommendBanner extends State<RecommendBanner> {
  List banner = [
    {"imagePath": 'assets/images/icon_image_1.png'},
    {"imagePath": 'assets/images/icon_image_2.png'},
    {"imagePath": 'assets/images/icon_image_3.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white), //设置背景颜色为白色
      child: ListView(
        children: [
          SizedBox(
              height: 300,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    banner[index]['imagePath'],
                    fit: BoxFit.fill,
                  );
                },
                onTap: (index) {
                  print("点击了下标:$index");
                  Navigator.pop(context); //返回上一页
                },
                itemCount: banner.length,
                autoplay: true,
                pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: Color(0xFFFFFFFF),
                        activeColor: Color(0xFFFF4646))),
              ))
        ],
      ),
    );
  }
}
