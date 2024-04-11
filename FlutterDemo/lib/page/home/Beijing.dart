import 'package:flutter/material.dart';

import '../util/Common.dart';

//北京
class BeijingPage extends StatefulWidget {
  const BeijingPage({super.key});

  @override
  State<BeijingPage> createState() => _BeijingPage();
}

class _BeijingPage extends State<BeijingPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: ListView(
          children: getListView("beijing"),
        )
    );
  }
}
