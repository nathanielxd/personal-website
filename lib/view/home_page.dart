import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:personal_website/data.dart';
import 'package:personal_website/view/theme/loop_color_widget.dart';
import 'package:personal_website/view/widgets/icon_widget.dart';
import 'package:personal_website/view/widgets/item_widget.dart';
import 'package:personal_website/view/widgets/responsive_widget.dart';
import 'package:personal_website/view/widgets/tab_bar_indicator_widget.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  // Tab index
  int index = 0;

  // Animations
  AnimationController controller;
  Animation animation;
  Animation<Offset> slideAnimation;

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

    Timer(Duration(milliseconds: 1500), (){
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          LoopedColoredContainer(
            begin: Colors.black, 
            end: Color(0xff060017)
          ),
          ResponsiveWidget(
            largeScreen: Column(
              children: [
                Spacer(),
                Row(
                  children: [
                    Spacer(flex: 6),
                    CustomTabBar(
                      index: index,
                      tabs: ['Home', 'Projects', 'About'],
                      onTap: (_index) => setState(() => index = _index),
                    ),
                    Spacer()
                  ]
                ),
                Spacer(),
                Expanded(
                  flex: 10,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 150),
                    child: [
                      Padding(
                        key: ValueKey('home'),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: _buildHome(),
                      ),
                      Padding(
                        key: ValueKey('projects'),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: _buildProjects()
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 400,
                            maxWidth: 1000
                          ),
                          child: _buildAbout(),
                        )
                      )
                    ][index]
                  )
                ),
                Spacer(flex: 2)
              ]
            ),
            smallScreen: Column(
              children: [
                Spacer(),
                Row(
                  children: [
                    Spacer(flex: 6),
                    CustomTabBar(
                      index: index,
                      tabs: ['Home', 'Projects', 'About'],
                      onTap: (_index) => setState(() => index = _index),
                    ),
                    Spacer()
                  ]
                ),
                Spacer(),
                Expanded(
                  flex: 12,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 150),
                    child: [
                      Padding(
                        key: ValueKey('home'),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: _buildHomeAltView(),
                      ),
                      Padding(
                        key: ValueKey('projects'),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: _buildProjectsAltView()
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 400,
                            maxWidth: 1000
                          ),
                          child: _buildAbout(),
                        )
                      )
                    ][index]
                  )
                )
              ]
            )
          )
        ]
      )
    );
  }

  Widget _buildHome() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: CircleAvatar(
                radius: 143,
                backgroundColor: Colors.white.withOpacity(0.9),
                child: CircleAvatar(
                  radius: 140,
                  backgroundImage: AssetImage('assets/profile_picture.jpeg'),
                )
              )
            ),
            Expanded(
              child: Column(
                children: [
                  IconWidget(
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
                              Text('me@nathans.dev', 
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
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(text: 'me@nathans.dev'));
                            Fluttertoast.showToast(
                              msg: 'Copied to clipboard.', 
                              toastLength: Toast.LENGTH_LONG,
                              webBgColor: 'linear-gradient(to right, #002e52, #000f30)'
                            );
                          },
                        )
                      ]
                    ),
                    onPressed: () {
                      js.context.callMethod('open', ['mailto:me@nathans.dev']);
                    }
                  ),
                  SizedBox(height: 24),
                  IconWidget(
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
                    onPressed: () {
                      js.context.callMethod('open', [Data.resumeLink]);
                    }
                  ),
                  SizedBox(height: 30),
                  IconWidget(
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
                    onPressed: () {
                      js.context.callMethod('open', ['https://github.com/nathanielxd']);
                    },
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
            child: AutoSizeText('Flutter | Mobile | Web Developer', 
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

  Widget _buildHomeAltView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: CircleAvatar(
                radius: 133,
                backgroundColor: Colors.white.withOpacity(0.9),
                child: CircleAvatar(
                  radius: 130,
                  backgroundImage: AssetImage('assets/profile_picture.jpeg'),
                )
              )
            ),
            Expanded(
              child: Column(
                children: [
                  IconWidget(
                    icon: Icon(Icons.mail, 
                      size: 48,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    onPressed: () {
                      js.context.callMethod('open', ['mailto:me@nathans.dev']);
                    }
                  ),
                  SizedBox(height: 24),
                  IconWidget(
                    icon: Icon(Icons.description, 
                      size: 48,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    onPressed: () {
                      js.context.callMethod('open', [Data.resumeLink]);
                    }
                  ),
                  SizedBox(height: 30),
                  IconWidget(
                    icon: Image.asset('assets/github.png', 
                      height: 48,
                      color: Colors.white.withOpacity(0.9)
                    ),
                    onPressed: () {
                      js.context.callMethod('open', ['https://github.com/nathanielxd']);
                    }
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
            child: AutoSizeText('Flutter | Mobile | Web Developer', 
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

  Widget _buildProjects() {
    return Wrap(
      children: Data.projects.map((e)
        => InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: ItemWidget(e),
          onTap: () => js.context.callMethod('open', [e.options[0].link])
        )
      ).toList()
    );
  }

  Widget _buildProjectsAltView() {
    return ListView.builder(
      itemCount: Data.projects.length,
      itemBuilder: (context, index)
      => Center(
        child: InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: ItemWidget(Data.projects[index]),
          onTap: () => js.context.callMethod('open', [Data.projects[index].options[0].link])
        ),
      )
    );
  }

  Widget _buildAbout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About me', style: TextStyle(
          fontSize: 28,
          color: Colors.white.withOpacity(0.9),
          fontWeight: FontWeight.w600
        )),
        SelectableText(Data.personalDescription),
        SizedBox(height: 24),
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
                children: [
                  Text('me@nathans.dev'),
                  SizedBox(width: 4),
                  Icon(Icons.copy, size: 20)
                ]
              ),
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: 'me@nathans.dev'));
                Fluttertoast.showToast(
                  msg: 'Copied to clipboard.', 
                  toastLength: Toast.LENGTH_LONG,
                  webBgColor: 'linear-gradient(to right, #002e52, #000f30)'
                );
              }
            )
          ]
        )
      ]
    );
  }
}