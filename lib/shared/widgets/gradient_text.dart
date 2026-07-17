import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    required this.text,
    required this.style,
    required this.gradient,
    super.key,
    this.textAlign,
  });

  final String text;
  final TextStyle style;
  final Gradient gradient;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      blendMode: BlendMode.srcIn,
      child: Text(
        text,
        textAlign: textAlign,
        style: style.copyWith(color: Colors.white), // important
      ),
    );
  }
}
