library animation_button;


import 'package:animation_button/flash_animation.dart';
import 'package:animation_button/pulse_animation.dart';
import 'package:flutter/material.dart';

import 'highlight_animation.dart';

/// A customizable animated button widget.
class AnimationButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color initialColor;
  final Color finalColor;
  final double initialWidth;
  final double finalWidth;
  final Duration duration;

   AnimationButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.initialColor = const Color(0xFFCCD5AE),
    this.finalColor = Colors.green,
    this.initialWidth = 200,
    this.finalWidth = 300,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimationButton> {
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
      child: HighlightAnimation(
        duration: const Duration(seconds: 1), // Set the animation speed.
        child: AnimatedContainer(
          duration: widget.duration,
          width: _isPressed ? widget.finalWidth : widget.initialWidth,
          height: 60,
          decoration: BoxDecoration(
            color: _isPressed ? widget.finalColor : widget.initialColor,
            borderRadius: BorderRadius.circular(_isPressed ? 30 : 50),

          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.notifications_outlined,color: Color(0xFF664343),size: 25,),
              SizedBox(width: 10,),
              Text(
                widget.text,
                style: const TextStyle(
                  color: Color(0xFF664343),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
