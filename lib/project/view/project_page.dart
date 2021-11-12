import 'package:flutter/material.dart';
import 'package:personal_website/project/project.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
		return BlocProvider(
      create: (_) => ProjectCubit(),
      child: ProjectView()
    );
  }
}
  