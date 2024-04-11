import 'package:flutter/material.dart';

import '../util/Common.dart';

//社会
class SocietyPage extends StatefulWidget {
  const SocietyPage({super.key});

  @override
  State<SocietyPage> createState() => _SocietyPage();
}

class _SocietyPage extends State<SocietyPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: ListView(
          children: getListView("society"),
        )
    );
  }
}
