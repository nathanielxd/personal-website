import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:personal_theme/personal_theme.dart';
import 'package:personal_website/home/home.dart';
import 'package:personal_website/landing/landing.dart';

class LandingView extends StatefulWidget {

  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400)
    );

    animation = CurvedAnimation(
      parent: controller, 
      curve: Curves.ease
    );

    slideAnimation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween(begin: Offset(0, -1), end: Offset(0, -1)), 
        weight: 1
      ),
      TweenSequenceItem(
        tween: Tween(begin: Offset(0, -1), end: Offset.zero),
        weight: 1
      )
    ]).animate(animation);

    Timer(Duration(seconds: 1), (){
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingCubit, LandingState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: CircleAvatar(
                    radius: state.isDesktop ? 143 : 133,
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child: InkWell(
                      child: CircleAvatar(
                        radius: state.isDesktop ? 140 : 130,
                        backgroundImage: AssetImage('assets/profile_picture.jpeg'),
                      ),
                      onTap: () => context.read<HomeNavigationCubit>().navigateToAbout()
                    ),
                  )
                ),
                Expanded(
                  child: Column(
                    children: [
                      AnimatedIconButton(
                        animated: state.isDesktop,
                        icon: Icon(Icons.mail, 
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
                                color: Colors.white.withOpacity(0.9)
                              )
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(state.email, 
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white.withOpacity(0.9),
                                      fontWeight: FontWeight.w200
                                    )
                                  ),
                                  SizedBox(width: 2),
                                  Icon(Icons.copy, size: 16)
                                ]
                              ),
                              onTap: () => context.read<LandingCubit>().copyEmail()
                            )
                          ]
                        ),
                        onPressed: () => context.read<LandingCubit>().openEmail()
                      ),
                      SizedBox(height: 24),
                      AnimatedIconButton(
                        animated: state.isDesktop,
                        icon: Icon(Icons.description, 
                          size: 48,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        label: Text('Resumé',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white.withOpacity(0.9)
                          )
                        ),
                        onPressed: () => context.read<LandingCubit>().openResume()
                      ),
                      SizedBox(height: 30),
                      AnimatedIconButton(
                        animated: state.isDesktop,
                        icon: Image.asset('assets/github.png', 
                          height: 48,
                          color: Colors.white.withOpacity(0.9)
                        ),
                        label: Text('GitHub', 
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white.withOpacity(0.9)
                          )
                        ),
                        onPressed: () => context.read<LandingCubit>().openGithub()
                      )
                    ]
                  )
                )
              ]
            ),
            FadeTransition(
              opacity: controller,
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text('Nathaniel Dragusin',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 64,
                    fontFamily: 'Manrope',
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w600
                  )
                )
              )
            ),
            SlideTransition(
              position: slideAnimation,
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: AutoSizeText(state.description, 
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Manrope',
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w300
                  ),
                )
              )
            )
          ]
        );
      }
    );
  }
}