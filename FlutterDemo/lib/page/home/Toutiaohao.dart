import 'package:flutter/material.dart';

import '../util/Common.dart';

//头条号
class ToutiaohaoPage extends StatefulWidget {
  const ToutiaohaoPage({super.key});

  @override
  State<ToutiaohaoPage> createState() => _ToutiaohaoPage();
}

class _ToutiaohaoPage extends State<ToutiaohaoPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: getListView("toutiaohao"),
      ),
    );
  }
}
