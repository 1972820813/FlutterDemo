import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../util/Common.dart';

//Dialog
class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPage();
}

class _DialogPage extends State<DialogPage> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(onPressed: () {
          showDialog(context: context, builder: (builder) {
            return AlertDialog(
              title: const Text("alert dialog"),
              content: const Text("alert content"),
              actions: [
                TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: const Text("确定")),
                TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: const Text("取消")),
              ],
            );
          });
        }, child: const Text("alert dialog")),
        ElevatedButton(onPressed: () {

        }, child: const Text("simple dialog")),
        ElevatedButton(
            onPressed: () {

            }, child: const Text("show sheet dialog")),
        ElevatedButton(onPressed: () {
          Fluttertoast.showToast(
              msg: "toast",
              textColor: Colors.red,
              backgroundColor: Colors.black);
        }, child: const Text("toast")),
      ],
    );
  }
}
