import 'package:flutter/material.dart';

class FlashAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final int flashes;

  const FlashAnimation({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.flashes = 3, // Number of times the widget flashes.
  }) : super(key: key);

  @override
  _FlashAnimationState createState() => _FlashAnimationState();
}

class _FlashAnimationState extends State<FlashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true, ); // Flashing effect.

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
