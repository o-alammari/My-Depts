import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.borderRadius,
    required this.text,
    this.enable = false,
    required this.textColor,
    required this.backgroundColor,
    this.fontSize,
    this.onPressed,
  });
  final String text;
  final Color backgroundColor;
  bool enable;
  final Color textColor;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      // width: 180,
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextButton(
        // onPressed: enable ? null : onPressed,
        // onPressed: enable ? onPressed : null,
        onPressed: onPressed,
        style: TextButton.styleFrom(
          // backgroundColor: backgroundColor,
          // backgroundColor: Color.fromARGB(255, 10, 52, 143),
          // backgroundColor: Color.fromARGB(255, 19, 57, 138),
          // backgroundColor: Color.fromARGB(255, 27, 65, 146),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
