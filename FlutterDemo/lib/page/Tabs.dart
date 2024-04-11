import 'package:flutter/material.dart';
import 'package:flutterdemo/page/routes/Routes.dart';
import 'package:flutterdemo/page/search/SearchPage.dart';
import '../drawer/leftDrawer.dart';
import './Home.dart';
import './Setting.dart';
import './Category.dart';
import './User.dart';
import './Message.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  final List<Widget> _page = const [
    HomePage(),
    CategoryPage(),
    MessagePage(),
    SettingPage(),
    UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      appBar: AppBar(
        actions: [
          Container(
            width: 50,
            height: 50,
            child: IconButton(
              onPressed: () {
                // 基本路由跳转
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) =>
                //         const SearchPage(arguments: {"title": "搜索页面"})));

                //命名路由跳转
                Navigator.pushNamed(
                  context,
                  gotoSearch,
                  arguments: {"title": "搜索", "aid": 20},
                );
              },
              icon: const Icon(Icons.search),
            ),
          )
        ],
        backgroundColor: Colors.red,
        title: const Text("Flutter"),
        centerTitle: true, //标题居中
      ),
      body: _page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.red,
          type: BottomNavigationBarType.fixed,
          //超过3个菜单以后需要配置
          currentIndex: _currentIndex,
          iconSize: 25,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "user")
          ]),
      floatingActionButton: Container(
        //修改FloatingActionButton的大小 间距等
        height: 60,
        width: 60,
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(30)),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 2 ? Colors.red : Colors.grey,
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              _currentIndex = 2;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
