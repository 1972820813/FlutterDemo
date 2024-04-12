import 'package:flutter/material.dart';

List<Tab> getTabs() {
  List<String> strList = [
    "推荐",
    "按钮",
    "弹窗",
    "通知",
    "北京",
    "社会",
    "头条号",
    "问答",
    "深圳"
  ];
  List<Tab> listTab = [];
  for (int i = 0; i < strList.length; i++) {
    listTab.add(Tab(
      child: Text(strList[i]),
    ));
  }

  return listTab;
}

List<Widget> getListView(String title) {
  List<Widget> list = [];
  for (int i = 0; i < 20; i++) {
    list.add(ListTile(title: Text("$title  $i")));
  }
  return list;
}
