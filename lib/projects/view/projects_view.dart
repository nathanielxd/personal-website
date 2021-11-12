import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:personal_website/project/project.dart';

class ProjectsView extends StatelessWidget {

  const ProjectsView({Key? key}) : super(key: key);

  static const projects = [
    ['Flutterfall', 'flutterfall.png', Colors.amber, BoxFit.contain, 'https://github.com/nathanielxd/flutterfall'],
    ['LAN Chat', 'lanchat.jpg', Colors.grey, BoxFit.cover, 'https://github.com/nathanielxd/simple-lan-chat/#simple-lan-chat'],
    ['Tapline', 'tapline.png', null, null, 'https://tapline.app'],
    ['MagicHome.NET', 'magichome.jpg', null, null, 'https://github.com/nathanielxd/magic-home'],
    ['Lightweight Vocabulary', 'vocabulary.jpg', null, null, 'https://github.com/nathanielxd/lightweightvocabulary']
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 32,
        runSpacing: 32,
        children: projects.map((e) 
          => ProjectWidget(
            title: e[0] as String,
            asset: e[1] as String,
            backgroundColor: e[2] as Color?,
            boxFit: e[3] as BoxFit?,
            onTap: () => js.context.callMethod('open', [e[4] as String])
          )
        ).toList()
      ),
    );
  }
}