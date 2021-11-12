import 'package:flutter/material.dart';
import 'package:personal_website/landing/landing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends StatelessWidget {
  
  final bool isDesktop;
  const LandingPage({Key? key, required this.isDesktop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
		return BlocProvider(
      create: (_) => LandingCubit(isDesktop: isDesktop),
      child: LandingView()
    );
  }
}
  