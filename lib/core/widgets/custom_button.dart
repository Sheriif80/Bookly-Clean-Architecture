import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    this.borderRadius,
    required this.text,
  });
  final String text;
  final Color textColor;

  final Color buttonColor;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {},

        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
          backgroundColor: buttonColor,
        ),

        child: Text(
          text,
          style: Styles.textMedium.copyWith(
            color: Colors.black,
            fontWeight: .bold,
          ),
        ),
      ),
    );
  }
}
