import 'package:flutter/material.dart';
import 'package:personal_theme/personal_theme.dart';
import 'package:personal_website/about/about.dart';
import 'package:personal_website/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/landing/landing.dart';
import 'package:personal_website/projects/projects.dart';

class HomeView extends StatelessWidget {

  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: ShiftingBackground(
                begin: Theme.of(context).scaffoldBackgroundColor, 
                end: Theme.of(context).primaryColor
              ),
            ),
            ResponsiveScreen(
              desktopScreen: BlocBuilder<HomeNavigationCubit, int>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Spacer(),
                      Row(
                        children: [
                          Spacer(flex: 6),
                          HomeTabBar(
                            currentIndex: state,
                            tabs: const ['Home', 'Projects', 'About'],
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
                              key: ValueKey('landing'),
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: LandingPage(isDesktop: true)
                            ),
                            Padding(
                              key: ValueKey('projects'),
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: ProjectsPage()
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 400,
                                  maxWidth: 1000
                                ),
                                child: AboutPage()
                              )
                            )
                          ][state]
                        )
                      ),
                      Spacer(flex: 2)
                    ]
                  );
                }
              ),
              phoneScreen: BlocBuilder<HomeNavigationCubit, int>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Spacer(),
                      Row(
                        children: [
                          Spacer(flex: 6),
                          HomeTabBar(
                            currentIndex: state,
                            tabs: const ['Home', 'Projects', 'About'],
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
                              child: LandingPage(isDesktop: false)
                            ),
                            Padding(
                              key: ValueKey('projects'),
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: ProjectsPage()
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 400,
                                  maxWidth: 1000
                                ),
                                child: AboutPage()
                              )
                            )
                          ][state]
                        )
                      )
                    ]
                  );
                }
              ),
            )
          ]
        )
      )
    );
  }
}