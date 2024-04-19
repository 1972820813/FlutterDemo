import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  const SharedPreferencesPage({super.key});

  @override
  State<SharedPreferencesPage> createState() => _SharedPreferencesPage();
}

class _SharedPreferencesPage extends State<SharedPreferencesPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  //保存值
  Future<void> saveData(String sign, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(sign, value);
  }

  //获取值
  Future<String?> getData(String sign) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sign);
  }

  //删除值  sign为删除数据的表示
  Future<void> deleteData(String sign) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(sign);
  }
}
