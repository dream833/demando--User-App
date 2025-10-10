import 'package:flutter/material.dart';

class CommonButtons extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Color color;
  final TextStyle? textStyle;

  const CommonButtons({
    super.key,
    required this.title,
    required this.onTap,
    this.textStyle,
    this.color = Colors.teal,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          title,
          style: textStyle ?? const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
