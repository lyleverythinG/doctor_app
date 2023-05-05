import 'package:doctor_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustomElevatedButton(
      {Key? key,
      this.onPressed,
      required this.text,
      this.fontSize,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Constants.kBlueAccent,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      ),
    );
  }
}
