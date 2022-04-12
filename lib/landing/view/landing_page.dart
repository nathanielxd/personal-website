import 'package:flutter/material.dart';
import 'package:personal_website/landing/landing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends StatelessWidget {
  
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
		return BlocProvider(
      create: (_) => LandingCubit(),
      child: LandingView()
    );
  }
}
  