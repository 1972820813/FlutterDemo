import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterdemo/page/routes/Routes.dart';
import 'package:device_info/device_info.dart';

//推荐
class RecommendedPage extends StatefulWidget {
  const RecommendedPage({super.key});

  @override
  State<RecommendedPage> createState() => _RecommendedPage();
}

class _RecommendedPage extends State<RecommendedPage> {
  String sign = "no message";

  Future<void> getDeviceMessage() async {
    if (Platform.isIOS) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        sign = iosInfo.identifierForVendor;
      });
      print('设备唯一标识：${iosInfo.identifierForVendor}');
    } else if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        sign = androidInfo.androidId;
      });
      print('设备唯一标识：${androidInfo.androidId}');
    } else if (Platform.isMacOS) {
    } else if (Platform.isWindows) {
    } else if (Platform.isLinux) {}
  }

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    getDeviceMessage();
                  },
                  child: const Text("文本按钮")),
              SizedBox(
                height: 40,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0), //设置padding
                  alignment: Alignment.centerLeft, //设置垂直居中
                  child: Text(
                    "设备信息(唯一标识码):$sign",
                    style: const TextStyle(
                        color: Color(0xfff000ff), fontSize: 12), //设置文字颜色
                  ),
                ),
              ),
            ],
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
                    //命名路由跳转，并传递参数，URL，或其他相关参数
                    Navigator.pushNamed(context, gotoWebView,
                        arguments: {"url": "https://www.baidu.com/"});
                  },
                  child: const Text("WebView页面")),
            ),
          ),
          SizedBox(
            height: 40,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0), //设置padding
              alignment: Alignment.centerLeft, //设置垂直居中
              child: TextButton(
                  onPressed: () {
                    //命名路由跳转，并传递参数，URL，或其他相关参数
                    Navigator.pushNamed(context, gotoSharedPreferences);
                  },
                  child: const Text("shared preferences")),
            ),
          ),
        ],
      ),
    );
  }
}
