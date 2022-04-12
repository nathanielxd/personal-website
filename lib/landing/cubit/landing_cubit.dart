import 'dart:js' as js;

import 'package:bloc/bloc.dart';
import 'package:fast_strings/fast_strings.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LandingCubit extends Cubit<void> {

  LandingCubit() : super(null);
  
  void copyEmail() async {
    await Clipboard.setData(ClipboardData(text: Strings.data['landing']['email']));
    // TODO replace fluttertoast with an alternative
    Fluttertoast.showToast(
      msg: 'Copied to clipboard.', 
      toastLength: Toast.LENGTH_LONG,
      webBgColor: 'linear-gradient(to right, #002e52, #000f30)'
    );
  }

  void openEmail() async => await js.context.callMethod('open', ['mailto:${Strings.data['landing']['email']}']);

  void openResume() async => await js.context.callMethod('open', [Strings.data['links']['resume']]);

  void openGithub() async => await js.context.callMethod('open', [Strings.data['links']['github']]);
}