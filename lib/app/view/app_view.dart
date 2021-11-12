import 'package:flutter/material.dart';
import 'package:personal_theme/personal_theme.dart';
import 'package:personal_website/home/home.dart';
import 'package:seo_renderer/seo_renderer.dart';

class AppView extends StatelessWidget {
  
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nathaniel Dragusin | Flutter Developer',
      theme: WebTheme.data,
      navigatorObservers: [ routeObserver ],
      routes: {
        '/projects': (context) => HomePage(index: 1),
        '/about': (context) => HomePage(index: 2)
      },
      home: HomePage(),
    );
  }
}