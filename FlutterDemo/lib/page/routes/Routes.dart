import 'package:flutter/material.dart';
import 'package:flutterdemo/page/recommend/RecommendBanner.dart';

import '../Tabs.dart';
import '../search/SearchPage.dart';

///跳转标识
String gotoSearch = "/goto_search";
String gotoBanner = "/goto_banner";

/// 设置路由，为跳转做准备
/// arguments 为传递的参数，在这里设置，则为必传参数
/// 有search页面和banner页面可以看到    是否设置arguments的区别
Map routes = {
  "/": (context) => const Tabs(),
  gotoSearch: (context, {arguments}) => SearchPage(arguments: arguments),
  gotoBanner: (context) => const RecommendBanner()
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));

      return route;
    }
  }
  return null;
};
