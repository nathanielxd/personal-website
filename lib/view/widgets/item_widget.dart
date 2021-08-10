import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_website/entities/item.dart';

class ItemWidget extends StatefulWidget {

  final Item item;

  ItemWidget(this.item);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> 
with SingleTickerProviderStateMixin {

  final random = Random();
  AnimationController animationController;
  Animation animation;
  Animation offsetAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250)
    );

    animation = Tween<double>(begin: 1, end: 0.95)
    .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.ease
    ));

    offsetAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
    .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.ease
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        animationController.forward();
      },
      onExit: (_) {
        animationController.reverse();
      },
      child: ScaleTransition(
        scale: animation,
        child: Padding(
          padding: EdgeInsets.only(top: 32, right: 32),
          child: Stack(
            children: [
              SizedBox(
                height: 200,
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/' + widget.item.asset, fit: BoxFit.cover)
                ),
              ),
              Positioned(
                right: 8,
                bottom: 8,
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, widget) 
                  => Container(
                    color: Colors.black.withOpacity(animationController.value),
                    child: widget,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(widget.item.name, style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      shadows: [Shadow(blurRadius: 1)]
                    ))
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}