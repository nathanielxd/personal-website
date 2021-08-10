import 'dart:math';

import 'package:flutter/material.dart';

class Themes {

  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    cardColor: Colors.white,
    accentColor: Color(0xffc9002f),
    primaryColor: Color(0xff7a0029),
    backgroundColor: Color(0xff260005),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.black45
    ),
    fontFamily: 'OpenSans',
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 56,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        fontFamily: 'Ubuntu'
      ),
      bodyText1: TextStyle(
        fontSize: 20,
        color: Colors.grey[300]
      ),
      bodyText2: TextStyle(
        fontSize: 20,
        color: Colors.grey[300]
      )
    )
  );

  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    cardColor: Colors.black,
    accentColor: Color(0xffc9002f),
    primaryColor: Color(0xff7a0029),
    backgroundColor: Colors.grey[200],
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.black45
    ),
    fontFamily: 'Ubuntu',
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 56,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        fontFamily: 'Ubuntu'
      ),
      bodyText1: TextStyle(
        fontSize: 20,
        color: Colors.grey[900]
      ),
      bodyText2: TextStyle(
        fontSize: 20,
        color: Colors.grey[900]
      )
    )
  );

  static List<Color> _presetColors = [
    Color(0xff063663),
    Color(0xff1f2830),
    Color(0xff1f2830),
    Color(0xff4f3fb5),
    Color(0xff620a7a),
    Color(0xff120047)
  ];

  static List<Color> getRandomColors(Random random, [int count = 2]) {
    return List.generate(count, (index) => _presetColors[random.nextInt(_presetColors.length)]);
  }

  static List<InlineSpan> generateGradientSpan(String data, {Color start, Color end}) {
    final r = (end.red - start.red) / data.length;
    final g = (end.green - start.green) / data.length;
    final b = (end.blue - start.blue) / data.length;

    return List.generate(data.length, (index) {
      final newRed = (start.red + index * r).toInt();
      final newGreen = (start.green + index * g).toInt();
      final newBlue = (start.blue + index * b).toInt();
      return TextSpan(
        text: data[index],
        style: TextStyle(
          color: Color.fromRGBO(newRed, newGreen, newBlue, 1)
        )
      );
    });
  }
}