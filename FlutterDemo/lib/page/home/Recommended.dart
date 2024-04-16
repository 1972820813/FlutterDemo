import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/page/routes/Routes.dart';

//推荐
class RecommendedPage extends StatefulWidget {
  const RecommendedPage({super.key});

  @override
  State<RecommendedPage> createState() => _RecommendedPage();
}

class _RecommendedPage extends State<RecommendedPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: [
          SizedBox(
            height: 40,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0), //设置padding
              alignment: Alignment.centerLeft, //设置垂直居中
              child: const Text(
                "功能列表",
                style:
                    TextStyle(color: Color(0xffff00ff), fontSize: 20), //设置文字颜色
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0), //设置padding
              alignment: Alignment.centerLeft, //设置垂直居中
              child: TextButton(
                  onPressed: () {
                    //命名路由跳转
                    Navigator.pushNamed(
                      context,
                      gotoBanner,
                    );
                  },
                  child: const Text("Banner页面")),
            ),
          ),
          SizedBox(
            height: 40,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0), //设置padding
              alignment: Alignment.centerLeft, //设置垂直居中
              child: TextButton(
                  onPressed: () {
                    //命名路由跳转
                    Navigator.pushNamed(
                      context,
                      gotoWebView,
                      arguments: {"url":"https://www.baidu.com/"}
                    );
                  },
                  child: const Text("WebView页面")),
            ),
          ),
        ],
      ),
    );
  }
}
