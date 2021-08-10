import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class IconWidget extends StatefulWidget {

  final Widget label;
  final Widget icon;
  final void Function() onPressed;

  IconWidget({
    @required this.icon,
    this.label,
    this.onPressed
  });

  @override
  _IconWidgetState createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> with SingleTickerProviderStateMixin {

  AnimationController animationController;

  Animation animation;
  Animation slideAnimation;
  Animation scaleAnimation;

  @override
  void initState() {
    super.initState();

    initAnimations();
  }

  void initAnimations() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150)
    );

    animation = CurvedAnimation(
      parent: animationController, 
      curve: Curves.ease
    );

    scaleAnimation = Tween<double>(begin: 1, end: 0.9)
      .animate(animation);
    slideAnimation = Tween<Offset>(begin: Offset(-0.5, 0), end: Offset.zero)
      .animate(animation);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(      
      onEnter: (_) => animationController.forward(),
      onExit: (_) => animationController.reverse(),
      child: Row(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: widget.icon
            ),
            onTap: widget.onPressed,
          ),
          SizedBox(width: 10),
          SlideTransition(
            position: slideAnimation,
            child: FadeTransition(
              opacity: animationController,
              child: widget.label
            )
          )
        ]
      )
    );
  }
}