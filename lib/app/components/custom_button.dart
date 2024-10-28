import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final double high;
  final double width;
  final double borderRadius;
  final VoidCallback? onPressed;
  final Color? color;
  const CustomButton({
    Key? key,
    required this.child,
    required this.width,
    required this.borderRadius,
    required this.high,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          minimumSize: Size(width, high),
        ),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}
