import 'package:flutter/material.dart';

import '../Tabs.dart';
import '../search/SearchPage.dart';

String gotoSearch = "/goto_search";

Map routes = {
  "/": (context) => const Tabs(),
  gotoSearch: (context, {arguments}) => SearchPage(arguments: arguments),
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
