import 'package:flutter/material.dart';

import '../util/Common.dart';

//深圳
class ShenzhenPage extends StatefulWidget {
  const ShenzhenPage({super.key});

  @override
  State<ShenzhenPage> createState() => _ShenzhenPage();
}

class _ShenzhenPage extends State<ShenzhenPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: getListView("shenzhen"),
      ),
    );
  }
}
