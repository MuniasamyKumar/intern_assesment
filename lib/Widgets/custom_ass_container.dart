import 'package:flutter/material.dart';

class CustomAssessmentContainer extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;
  const CustomAssessmentContainer({
    super.key,
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SizedBox(
                height: double.infinity,
                width: MediaQuery.of(context).size.width / 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Color(0xff222E58),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  content,
                  style: const TextStyle(
                      color: Color(0xff2A2A2A),
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.play_circle,
                      color: Color(0xff255FD5),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Start",
                      style: TextStyle(
                          color: Color(0xff255FD5),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
