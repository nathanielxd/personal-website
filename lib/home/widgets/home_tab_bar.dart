import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/home/home.dart';

class HomeTabBar extends StatelessWidget{

  final int currentIndex;
  final List<String> tabs;

  HomeTabBar({
    required this.currentIndex, 
    required this.tabs
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(tabs.length, 
        (index) => Padding(
          padding: const EdgeInsets.only(right: 12),
          child: InkWell(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 150),
              child: Text(tabs[index], style: TextStyle(
                fontSize: 24,
                color: currentIndex == index
                  ? Colors.white.withOpacity(1) : Colors.white.withOpacity(0.7)
              ))
            ),
            onTap: () => context.read<HomeNavigationCubit>().navigateTo(index)
          )
        )
      )
    );
  }
}