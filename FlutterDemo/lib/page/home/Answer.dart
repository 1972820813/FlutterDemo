import 'package:flutter/material.dart';

import '../util/Common.dart';

//问答
class AnswerPage extends StatefulWidget {
  const AnswerPage({super.key});

  @override
  State<AnswerPage> createState() => _AnswerPage();
}

class _AnswerPage extends State<AnswerPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: getListView("answer"),
      ),
    );
  }
}
