import 'dart:js' as js;

import 'package:bloc/bloc.dart';
import 'package:fast_strings/fast_strings.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AboutCubit extends Cubit<void> {
  AboutCubit() : super(null);

  void copyEmail() async {
    await Clipboard.setData(ClipboardData(text: 'dragusinnathaniel@gmail.com'));
    Fluttertoast.showToast(
        msg: 'Copied to clipboard.',
        toastLength: Toast.LENGTH_LONG,
        webBgColor: 'linear-gradient(to right, #002e52, #000f30)');
  }

  void openResume() async =>
      await js.context.callMethod('open', [Strings.data['links']['resume']]);

  void openGithub() async =>
      await js.context.callMethod('open', [Strings.data['links']['github']]);

  void openLinkedin() async =>
      await js.context.callMethod('open', [Strings.data['links']['linkedin']]);
}
