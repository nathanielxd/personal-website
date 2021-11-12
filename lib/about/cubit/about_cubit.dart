import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AboutCubit extends Cubit<void> {

  AboutCubit() : super(null);

  void copyEmail() async {
    await Clipboard.setData(ClipboardData(text: 'me@nathans.dev'));
    Fluttertoast.showToast(
      msg: 'Copied to clipboard.', 
      toastLength: Toast.LENGTH_LONG,
      webBgColor: 'linear-gradient(to right, #002e52, #000f30)'
    );
  }
}