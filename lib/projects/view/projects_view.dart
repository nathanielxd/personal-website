import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:personal_website/project/project.dart';
import 'package:seo_renderer/seo_renderer.dart';

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
    final width = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: width > 1200 ? width * 0.8 : 600,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Wrap(
            spacing: 32,
            runSpacing: 32,
            children: projects.map((e) 
              => LinkRenderer(
                anchorText: e[0] as String,
                link: e[4] as String,
                child: ProjectWidget(
                  title: e[0] as String,
                  asset: e[1] as String,
                  backgroundColor: e[2] as Color?,
                  boxFit: e[3] as BoxFit?,
                  onTap: () => js.context.callMethod('open', [e[4] as String])
                ),
              )
            ).toList()
          ),
        ),
      ),
    );
  }
}