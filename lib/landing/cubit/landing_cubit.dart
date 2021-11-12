import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'dart:js' as js;
import 'package:fluttertoast/fluttertoast.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {

  final bool isDesktop;
  LandingCubit({required this.isDesktop}) : super(LandingState(isDesktop: isDesktop));
  
  void copyEmail() async {
    await Clipboard.setData(ClipboardData(text: state.email));
    // TODO replace fluttertoast with an alternative
    Fluttertoast.showToast(
      msg: 'Copied to clipboard.', 
      toastLength: Toast.LENGTH_LONG,
      webBgColor: 'linear-gradient(to right, #002e52, #000f30)'
    );
  }

  void openEmail() async => await js.context.callMethod('open', ['mailto:${state.email}']);

  void openResume() async => await js.context.callMethod('open', [state.resumeLink]);

  void openGithub() async => await js.context.callMethod('open', [state.githubLink]);
}