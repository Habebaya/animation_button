library animation_button;

import 'package:flutter/material.dart';

/// A customizable animated button widget.

class AnimationButton extends StatefulWidget {

  final VoidCallback? onPressed;
  final String title;
  final TextStyle textStyle;
  final Color buttonBackgroundColor;
  final double initialWidth;
  final double initialHeight;
  final Duration animatedContainerDuration;
  final Duration highlightDuration;
  final double buttonBorderRadius;
  final Widget? iconNextTitle;

  final Widget child;
  final Color startColor;
  final Color endColor;
  final double animationBorderRadius;
  final double blurRadius;
  final double spreadRadius;

  AnimationButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.buttonBorderRadius = 50.0,
    this.buttonBackgroundColor = const Color(0xFFCCD5AE),
    this.iconNextTitle,
    this.initialWidth = 250,
    this.initialHeight = 50,
    this.textStyle = const TextStyle(
      color: Color(0xFF664343),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),

    required this.animatedContainerDuration,
    this.child = const SizedBox.shrink(),
    this.startColor = Colors.white,
    this.animationBorderRadius = 50,
    this.blurRadius = 10,
    this.spreadRadius = 5,
    this.endColor = const Color(0xFFE0E5B6),
    this.highlightDuration = const Duration(seconds: 1),
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimationButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.highlightDuration,
      vsync: this,
    )..repeat(reverse: true); // Loops the animation back and forth.

    _colorAnimation = ColorTween(
      begin: widget.startColor,
      end: widget.endColor,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed!();
      },
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return AnimatedContainer(
            duration: widget.animatedContainerDuration,
            width: widget.initialWidth,
            height: widget.initialHeight,
            decoration: BoxDecoration(
              color: widget.buttonBackgroundColor,
              borderRadius: BorderRadius.circular(widget.buttonBorderRadius),
              boxShadow: [
                BoxShadow(
                  color: _colorAnimation.value!,
                  blurRadius: widget.blurRadius,
                  spreadRadius: widget.spreadRadius,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.iconNextTitle == null
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        width: 20,
                      ),
                Text(widget.title, style: widget.textStyle),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
