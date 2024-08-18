import 'package:flutter/material.dart';

class CustomReportCard extends StatelessWidget {
  const CustomReportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.20),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset("assets/Layer 32.png"),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Cancer 2nd Opinion',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Text color
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
