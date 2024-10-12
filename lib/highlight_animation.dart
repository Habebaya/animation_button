import 'package:flutter/material.dart';

class HighlightAnimation extends StatefulWidget {
  final Widget child;
  final Color startColor;
  final Color endColor;
  final Duration duration;

  const HighlightAnimation({
    Key? key,
    required this.child,
    this.startColor = Colors.white,
    this.endColor = const Color(0xFFE0E5B6),
    this.duration = const Duration(seconds: 1),
  }) : super(key: key);

  @override
  _HighlightAnimationState createState() => _HighlightAnimationState();
}

class _HighlightAnimationState extends State<HighlightAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true); // Loops the animation back and forth.

    _colorAnimation = ColorTween(
      begin: widget.startColor,
      end: widget.endColor,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            color: _colorAnimation.value,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: _colorAnimation.value!,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
