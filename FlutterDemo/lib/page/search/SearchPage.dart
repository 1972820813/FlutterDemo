import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final Map arguments;

  const SearchPage({super.key, required this.arguments});

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  late String title = "哈哈";

  @override
  void initState() {
    super.initState();
    title = widget.arguments["title"];
    print("Alex   ${widget.arguments}");
    print("Alex   $title");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: TextButton(
        onPressed: () {
          //返回上一页面
          Navigator.pop(context);
        },
        child: Text(title),
      ),
    );
  }
}
