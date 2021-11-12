import 'package:flutter/material.dart';
import 'package:personal_website/about/about.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutView extends StatelessWidget {

  const AboutView({Key? key}) : super(key: key);

  static const personalDescription =
    'Enthusiastic developer with strong experience in the mobile development ecosystem, project architecture and app design. '
    'As a young developer, I put passion into my work and deliver quality products. '
    'With 3 apps and 2 libraries published, Flutter has become main focus in my career. \n';

  static const workDescription = 
    'The process of creating a scalable and sustainable product is performing separation and abstraction as much as possible. '
    'In Flutter, this type of clean architecture is achievable by separating what makes an app: UI, providers, logic and data repositories; '
    'and then reorganizing them by functionality. This not only ensures scalability, efficient test writing and simplicity, '
    'but also straightforward bug tracking. \n'
    'Consistent architectural rules ensure the product will not break when continuously adding functionality on top of it.';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('About me', style: TextStyle(
          fontSize: 28,
          color: Colors.white.withOpacity(0.9),
          fontWeight: FontWeight.w600
        )),
        SelectableText(personalDescription),
        SizedBox(height: 36),
        Text('How I work', style: TextStyle(
          fontSize: 28,
          color: Colors.white.withOpacity(0.9),
          fontWeight: FontWeight.w600
        )),
        SelectableText(workDescription),
        SizedBox(height: 36),
        Text('Contact', 
          style: TextStyle(
            fontSize: 28,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w600
          )
        ),
        Wrap(
          children: [
            SelectableText('For any business inquiries, please e-mail me at '),
            InkWell(
              splashColor: Colors.transparent,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('me@nathans.dev'),
                  SizedBox(width: 4),
                  Icon(Icons.copy, size: 20)
                ]
              ),
              onTap: () => context.read<AboutCubit>().copyEmail()
            )
          ]
        )
      ]
    );
  }
}