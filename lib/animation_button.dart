library animation_button;

import 'package:flutter/material.dart';

/// A customizable animated button widget.

class AnimationButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String text;
  final TextStyle textStyle;
  final Color initialColor;
  final Color finalColor;
  final Color iconColor;
  final double initialWidth;
  final double initialHeight;
  final Duration duration;
  final Duration highlightDuration;
  final double buttonBorderRadius;

  final Widget child;
  final Color startColor;
  final Color endColor;
  final double animationBorderRadius;
  final double blurRadius;
  final double spreadRadius;
  final bool isButton;

  AnimationButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.buttonBorderRadius = 50.0,
      this.initialColor = const Color(0xFFCCD5AE),
      this.finalColor = Colors.green,
      this.iconColor = const Color(0xFF664343),
      this.initialWidth = 250,
      this.initialHeight = 50,
      this.textStyle = const TextStyle(
        color: Color(0xFF664343),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),

      // Animation parameters
      this.duration = const Duration(milliseconds: 300),
      this.child = const SizedBox.shrink(),
      this.startColor = Colors.white,
      this.animationBorderRadius = 50,
      this.blurRadius = 10,
      this.spreadRadius = 5,
      this.endColor = const Color(0xFFE0E5B6),
      this.highlightDuration = const Duration(seconds: 1),
      this.isButton = true})
      : super(key: key);

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

  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
        if (widget.onPressed != null) widget.onPressed!();
      },
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return Container(
              decoration: BoxDecoration(
                color: _colorAnimation.value,
                borderRadius:
                    BorderRadius.circular(widget.animationBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: _colorAnimation.value!,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: widget.isButton
                  ? AnimatedContainer(
                      duration: widget.duration,
                      width: widget.initialWidth,
                      height: widget.initialHeight,
                      decoration: BoxDecoration(
                        color: _isPressed
                            ? widget.finalColor
                            : widget.initialColor,
                        borderRadius:
                            BorderRadius.circular(widget.buttonBorderRadius),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications_outlined,
                            color: widget.iconColor,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(widget.text, style: widget.textStyle),
                        ],
                      ),
                    )
                  : widget.child);
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
