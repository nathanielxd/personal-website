import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(ProjectState());
  
}