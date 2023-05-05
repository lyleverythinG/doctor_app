import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  const CustomText({Key? key, required this.text, this.color, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontSize: fontSize ?? 16, fontWeight: FontWeight.bold, color: color),
    );
  }
}
