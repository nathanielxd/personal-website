import 'package:flutter/material.dart';
import 'package:personal_website/view/home_page.dart';
import 'package:personal_website/view/theme/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nathans.dev',
      theme: Themes.dark,
      home: HomePage(),
    );
  }
}