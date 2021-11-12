import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';

class ProjectWidget extends StatefulWidget {

  final String title;
  final String asset;
  final BoxFit? boxFit;
  final Color? backgroundColor;
  final void Function() onTap;

  const ProjectWidget({ 
    Key? key,
    required this.title,
    required this.asset,
    this.boxFit,
    this.backgroundColor,
    required this.onTap
  }) : super(key: key);

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> animation;

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
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => animationController.forward(),
        onExit: (_) => animationController.reverse(),
        child: ScaleTransition(
          scale: animation,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: widget.backgroundColor ?? Colors.transparent
                ),
                height: 200,
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/' + widget.asset, fit: widget.boxFit ?? BoxFit.cover)
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
                    child: TextRenderer(
                      text: Text(widget.title, style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        shadows: const [Shadow(blurRadius: 1)]
                      )),
                    )
                  )
                )
              )
            ]
          )
        )
      ),
    );
  }
}