import 'package:flutter/material.dart';

class CustomHeadLine extends StatelessWidget {
  final String category;
  const CustomHeadLine({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style: const TextStyle(
              color: Color(0xff303030),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              const Text(
                "View All",
                style: TextStyle(
                  color: Color(0xff303030),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                  radius: 19,
                  backgroundColor: const Color(0xff232F58),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      )))
            ],
          ),
        ],
      ),
    );
  }
}
