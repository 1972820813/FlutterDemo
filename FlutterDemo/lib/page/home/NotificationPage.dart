import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';

//通知
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    //设置通知
    var android = const AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: android);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> _showNotification() async {
    //可以设置通知的通道id和名称以及通道的描述
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'your channel id', 'your channel name', 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, 'notification title',
        'notification content', platformChannelSpecifics,
        payload: 'item x');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text("通知按钮"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await _showNotification();
                    Fluttertoast.showToast(
                        msg: "点击通知消息按钮",
                        textColor: Colors.red,
                        backgroundColor: Colors.black);
                  },
                  child: const Text("通知消息")),
              OutlinedButton(
                  style: ButtonStyle(
                      // elevation: MaterialStateProperty.all(20),//阴影效果
                      foregroundColor:
                          MaterialStateProperty.all(Colors.lightBlue),
                      side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.red))),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "点击角标按钮",
                        textColor: Colors.red,
                        backgroundColor: Colors.black);
                  },
                  child: const Text("角标"))
            ],
          ),
        ],
      ),
    );
  }
}
