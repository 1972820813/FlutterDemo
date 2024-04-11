import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Drawer(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: DrawerHeader(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://img1.baidu.com/it/u=3515163383,4118478370&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800"),
                            fit: BoxFit.cover),
                      ),
                      child: Text(
                        "data",
                        style: TextStyle(color: Colors.white),
                      )))
            ],
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.settings)),
            title: Text("系统设置"),
          ),
          Divider()
        ],
      ),
    );
  }
}
