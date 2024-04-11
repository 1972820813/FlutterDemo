import 'package:flutter/material.dart';
import 'package:flutterdemo/page/routes/Routes.dart';

void main() {
  //入口方法
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: MyRoute().route,
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
