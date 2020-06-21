import 'package:flutter/material.dart';
import '../shared/app_colors.dart';

class TextLink extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final double size;
  final bool enabled;

  const TextLink(
    this.text, {
    this.onPressed,
    this.color = primaryColor,
    this.size = 12,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onPressed : (){},
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: size,
          color: color,
        ),
      ),
    );
  }
}
