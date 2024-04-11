import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//按钮
class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPage();
}

class _ButtonPage extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 20),
          const Text("不带图标的按钮"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "点击普通按钮",
                        textColor: Colors.red,
                        backgroundColor: Colors.black);
                  },
                  child: const Text("普通按钮")),
              TextButton(
                  onPressed: () {
                    print("点击文本按钮");
                  },
                  child: const Text("文本按钮")),
              OutlinedButton(
                  onPressed: () {
                    print("点击边框按钮");
                  },
                  child: const Text("边框按钮")),
              IconButton(
                  onPressed: () {
                    print("点击文本按钮");
                  },
                  icon: const Icon(Icons.message))
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          const Text("带图标的按钮"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.send),
                  label: const Text("按钮")),
              TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.message),
                  label: const Text("按钮")),
              OutlinedButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.notification_add),
                  label: const Text("按钮")),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          const Text("修改按钮样式"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () {
                    print("点击普通按钮");
                  },
                  child: const Text("普通按钮")),
              OutlinedButton(
                  style: ButtonStyle(
                      // elevation: MaterialStateProperty.all(20),//阴影效果
                      foregroundColor:
                          MaterialStateProperty.all(Colors.lightBlue),
                      side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.red))),
                  onPressed: null,
                  child: const Text("按钮"))
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          const Text("修改按钮尺寸"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () {
                      print("点击普通按钮");
                    },
                    child: const Text("普通按钮")),
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlueAccent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ))),
                  onPressed: null,
                  child: const Text("圆角"),
                ),
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlueAccent),
                      shape: MaterialStateProperty.all(BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ))),
                  onPressed: null,
                  child: const Text("棱角"),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          const Text("登录按钮"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      margin: const EdgeInsets.all(20),
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {
                          print("登录成功");
                        },
                        child: Text("login"),
                      )))
            ],
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
