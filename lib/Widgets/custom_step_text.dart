import 'package:flutter/material.dart';

class CustomStepText extends StatelessWidget {
  final String text;
  const CustomStepText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, height: 2),
    );
  }
}
