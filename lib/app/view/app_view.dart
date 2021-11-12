import 'package:flutter/material.dart';
import 'package:personal_theme/personal_theme.dart';
import 'package:personal_website/home/home.dart';

class AppView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nathans.dev',
      theme: WebTheme.data,
      routes: {
        '/projects': (context) => HomePage(index: 1),
        '/about': (context) => HomePage(index: 2)
      },
      home: HomePage(),
    );
  }
}