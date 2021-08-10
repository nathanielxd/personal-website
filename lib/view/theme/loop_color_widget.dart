import 'package:flutter/material.dart';

class LoopedColoredContainer extends StatefulWidget {

  final Color begin;
  final Color end;
  final Duration duration;

  const LoopedColoredContainer({
    @required this.begin,
    @required this.end,
    this.duration = const Duration(seconds: 10)
  });

  @override
  _LoopedColoredContainerState createState() => _LoopedColoredContainerState();
}

class _LoopedColoredContainerState extends State<LoopedColoredContainer> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<Color> animation;
  
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: widget.duration
    );

    animation = ColorTween(
      begin: widget.begin,
      end: widget.end
    ).animate(controller);

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, widget) {
        return Container(
          color: animation.value,
        );
      }
    );
  }
}