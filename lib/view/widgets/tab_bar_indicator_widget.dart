import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {

  final int index;
  final List<String> tabs;
  final void Function(int index) onTap;

  CustomTabBar({@required this.index, this.tabs, this.onTap});

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.tabs.length, (i) 
        => Padding(
          padding: const EdgeInsets.only(right: 12),
          child: InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 150),
              child: Text(widget.tabs[i], style: TextStyle(
                fontSize: 24,
                color: widget.index == i 
                  ? Colors.white.withOpacity(1) : Colors.white.withOpacity(0.7)
              ))
            ),
            onTap: () => widget.onTap(i)
          )
        )
      )
    );
  }
}