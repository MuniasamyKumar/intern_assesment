import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String difficulty;
  final String tag;
  final String imageUrl;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.difficulty,
    required this.tag,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.grey)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Image.asset(
                imageUrl,
                width: 140,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                          fontSize: 15, color: Color(0xff666666)),
                    ),
                    const SizedBox(height: 8),
                    Chip(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                              width: 1, color: Color(0xff666666))),
                      label: Text(
                        tag,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      labelStyle: const TextStyle(color: Color(0xff255FD5)),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text(
                          'Difficulty : ',
                          style:
                              TextStyle(fontSize: 15, color: Color(0xff666666)),
                        ),
                        Text(
                          difficulty,
                          style: const TextStyle(
                              color: Color(0xffFF88A5),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
