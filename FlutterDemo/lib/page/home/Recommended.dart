import 'package:flutter/material.dart';
import 'package:flutterdemo/page/search/SearchPage.dart';

import '../routes/Routes.dart';

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
          Row(
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
                  child: const Text("搜索"))
            ],
          )
        ],
      ),
    );
  }
}
