import 'package:flutter/material.dart';
import './util/Common.dart';
import 'home/Answer.dart';
import 'home/Beijing.dart';
import 'home/Button.dart';
import 'home/DialogPage.dart';
import 'home/Recommended.dart';
import 'home/Shenzhen.dart';
import 'home/Society.dart';
import 'home/Toutiaohao.dart';
import 'home/NotificationPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: getTabs().length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        print("${_tabController.index}"); //获取两次
      }
    });
  }

  //生命周期  销毁方法
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
          height: 30,
          child: TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black26,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2.0,
            isScrollable: true,
            controller: _tabController,
            tabs: getTabs(),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          RecommendedPage(),
          ButtonPage(),
          DialogPage(),
          NotificationPage(),
          BeijingPage(),
          SocietyPage(),
          ToutiaohaoPage(),
          AnswerPage(),
          ShenzhenPage(),
        ],
      ),
    );
  }
}
