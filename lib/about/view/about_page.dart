import 'package:flutter/material.dart';
import 'package:personal_website/about/about.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
		return BlocProvider(
      create: (_) => AboutCubit(),
      child: AboutView()
    );
  }
}
  