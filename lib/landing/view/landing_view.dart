import 'dart:async';
import 'dart:html';

import 'package:fast_strings/fast_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:personal_theme/personal_theme.dart';
import 'package:personal_website/home/home.dart';
import 'package:personal_website/landing/landing.dart';
import 'package:seo_renderer/seo_renderer.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    animation = CurvedAnimation(parent: controller, curve: Curves.ease);

    slideAnimation = TweenSequence<Offset>([
      TweenSequenceItem(
          tween: Tween(begin: Offset(0, -1), end: Offset(0, -1)), weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Offset(0, -1), end: Offset.zero), weight: 1)
    ]).animate(animation);

    playDelayedAnimation();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void playDelayedAnimation() async {
    await Future.delayed(Duration(seconds: 1));
    if (mounted) {
      await controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isWide = constraints.maxWidth > constraints.maxHeight * 1.2;
      return Padding(
        padding: const EdgeInsets.only(top: 36),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Spacer(),
                Padding(
                    padding: const EdgeInsets.only(right: 32),
                    child: CircleAvatar(
                      radius: isWide ? 123 : 103,
                      backgroundColor: Colors.white.withOpacity(0.9),
                      child: InkWell(
                          child: CircleAvatar(
                            radius: isWide ? 120 : 100,
                            backgroundImage:
                                AssetImage('assets/profile_picture.png'),
                          ),
                          onTap: () => context
                              .read<HomeNavigationCubit>()
                              .navigateToAbout()),
                    )),
                Expanded(
                    child: Column(children: [
                  AnimatedIconButton(
                      animated: isWide,
                      icon: Icon(
                        Icons.mail,
                        size: 48,
                        color: Colors.white.withOpacity(0.9),
                      ),
                      label: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Contact',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white.withOpacity(0.9))),
                            InkWell(
                                splashColor: Colors.transparent,
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(Strings.data['landing']['email'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              fontWeight: FontWeight.w200)),
                                      SizedBox(width: 2),
                                      Icon(Icons.copy, size: 16)
                                    ]),
                                onTap: () =>
                                    context.read<LandingCubit>().copyEmail())
                          ]),
                      onPressed: () =>
                          context.read<LandingCubit>().openEmail()),
                  SizedBox(height: 24),
                  AnimatedIconButton(
                      animated: isWide,
                      icon: Icon(
                        Icons.description,
                        size: 48,
                        color: Colors.white.withOpacity(0.9),
                      ),
                      label: Text('Resumé',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.9))),
                      onPressed: () =>
                          context.read<LandingCubit>().openResume()),
                  SizedBox(height: 30),
                  AnimatedIconButton(
                      animated: isWide,
                      icon: Image.asset('assets/github.png',
                          height: 48, color: Colors.white.withOpacity(0.9)),
                      label: Text('GitHub',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.9))),
                      onPressed: () =>
                          context.read<LandingCubit>().openGithub())
                ]))
              ]),
              FadeTransition(
                  opacity: controller,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: TextRenderer(
                        element: HeadingElement.h1(),
                        text: Text('Nathaniel Dragusin',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 64,
                                fontFamily: 'Manrope',
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w600)),
                      ))),
              SlideTransition(
                  position: slideAnimation,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: AutoSizeText(
                        Strings.data['landing']['description'],
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'Manrope',
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.w300),
                      )))
            ]),
      );
    });
  }
}
