import 'package:flutter/material.dart';
import 'package:personal_website/app/app.dart';
import 'package:fast_strings/fast_strings.dart';
import 'configure_web.dart';

void main() async {
  configureApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Strings.initialize('assets/locale_en.yaml');
  runApp(App());
}