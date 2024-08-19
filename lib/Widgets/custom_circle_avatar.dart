import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String data;
  final String img;
  const CustomCircleAvatar({
    super.key,
    required this.data,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
              side: const BorderSide(color: Colors.grey, width: 2)),
          child: Container(
            height: 70,
            width: 70,
            color: Colors.white,
            child: Center(
              child: SizedBox(
                height: 35,
                width: 35,
                child: Image.asset(
                  img,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 90,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              data,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff303030),
                  overflow: TextOverflow.clip),
            ),
          ),
        )
      ],
    );
  }
}
