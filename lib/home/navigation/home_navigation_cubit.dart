import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigationCubit extends Cubit<int> {

  HomeNavigationCubit(int initialIndex) : super(initialIndex);

  void navigateTo(int index) => emit(index);
  void navigateToLanding() => emit(0);
  void navigateToProjects() => emit(1);
  void navigateToAbout() => emit(2);
}