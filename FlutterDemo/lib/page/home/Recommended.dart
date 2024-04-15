import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../routes/Routes.dart';

//推荐
class RecommendedPage extends StatefulWidget {
  const RecommendedPage({super.key});

  @override
  State<RecommendedPage> createState() => _RecommendedPage();
}

class _RecommendedPage extends State<RecommendedPage> {
  List banner = [
    {"imagePath": 'assets/images/icon_image_1.png'},
    {"imagePath": 'assets/images/icon_image_2.png'},
    {"imagePath": 'assets/images/icon_image_3.png'},
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // //页面跳转一
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (BuildContext context) {
                    //   return const SearchPage(
                    //     arguments: {"title": "搜索页面"},
                    //   );
                    // }));

                    //命名路由跳转
                    Navigator.pushNamed(
                      context,
                      gotoSearch,
                      arguments: {"title": "搜索页面", "aid": 20},
                    );
                  },
                  child: const Text("搜索")),
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
                    },
                    itemCount: banner.length,
                    autoplay: true,
                    pagination: const SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            color: Color(0xFFFFFFFF),
                            activeColor: Color(0xFFFF4646))),
                    // control: const SwiperControl(),//< >
                  ))
            ],
          )
        ],
      ),
    );
  }
}
