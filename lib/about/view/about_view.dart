import 'dart:html';

import 'package:fast_strings/fast_strings.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/about/about.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seo_renderer/seo_renderer.dart';

class AboutView extends StatelessWidget {

  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: width > 1200 ? width * 0.6 : 600,
      ),
      child: ListView(
        children: [
          TextRenderer(
            element: HeadingElement.h2(),
            text: Text('About me', style: TextStyle(
              fontSize: 28,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w600
            )),
          ),
          TextRenderer(text: SelectableText(Strings.data['about']['personal-description'])),
          SizedBox(height: 36),
          TextRenderer(
            element: HeadingElement.h2(),
            text: Text('How I work', style: TextStyle(
              fontSize: 28,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w600
            )),
          ),
          TextRenderer(text: SelectableText(Strings.data['about']['work-description'])),
          SizedBox(height: 36),
          TextRenderer(
            element: HeadingElement.h2(),
            text: Text('Contact', 
              style: TextStyle(
                fontSize: 28,
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w600
              )
            ),
          ),
          Wrap(
            children: [
              TextRenderer(
                text: SelectableText('For any business inquiries, please e-mail me at ')
              ),
              InkWell(
                splashColor: Colors.transparent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    TextRenderer(text: Text('me@nathans.dev')),
                    SizedBox(width: 4),
                    Icon(Icons.copy, size: 20)
                  ]
                ),
                onTap: () => context.read<AboutCubit>().copyEmail()
              )
            ]
          ),
          SizedBox(height: 36),
          InkWell(
            onTap: () => context.read<AboutCubit>().openLinkedin(),
            child: Row(
              children: [
                Image.asset('assets/linkedin.png', 
                  height: 40,
                  color: Colors.white.withOpacity(0.9),
                ),
                SizedBox(width: 12),
                Text('Linkedin',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.9)
                  )
                )
              ]
            )
          )
        ]
      ),
    );
  }
}