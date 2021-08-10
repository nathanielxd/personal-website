import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {

  final Widget smallScreen;
  final Widget largeScreen;

  ResponsiveWidget({this.smallScreen, this.largeScreen});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print(constraints);
        if(constraints.maxHeight < constraints.maxWidth * 1.2)
          return largeScreen;
        else return smallScreen;
      },
    );
  }
}