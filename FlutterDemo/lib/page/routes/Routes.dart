import 'package:flutter/material.dart';
import 'package:flutterdemo/page/recommend/RecommendBanner.dart';
import 'package:flutterdemo/page/recommend/RecommendWebView.dart';
import 'package:flutterdemo/page/recommend/SharedPreferencesPage.dart';

import '../Tabs.dart';
import '../search/SearchPage.dart';

String LOG_TAG = "alex";

///跳转标识
String gotoSearch = "/goto_search";
String gotoBanner = "/goto_banner";
String gotoWebView = "/goto_webView";
String gotoSharedPreferences = "/goto_SharedPreferences";

/// 设置路由，为跳转做准备
/// arguments 为传递的参数，在这里设置，则为必传参数
/// 有search页面和banner页面可以看到    是否设置arguments的区别
/// 传递参数，页面前面取消使用const
Map routes = {
  "/": (context) => const Tabs(),
  gotoSearch: (context, {arguments}) => SearchPage(arguments: arguments),
  gotoBanner: (context) => const RecommendBanner(),
  gotoWebView: (context, {arguments}) => RecommendWebView(arguments: arguments),
  gotoSharedPreferences: (context) => const SharedPreferencesPage(),
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
