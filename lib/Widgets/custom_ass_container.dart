import 'package:flutter/material.dart';

class CustomAssessmentContainer extends StatelessWidget {
  const CustomAssessmentContainer({
    super.key,
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
            SizedBox(
              height: double.infinity,
              width: MediaQuery.of(context).size.width / 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Image.asset(
                  "assets/Rectangle 2682.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15, top: 5, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fitness Assessment",
                    style: TextStyle(
                        color: Color(0xff222E58),
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Get started on your fitness \ngoals with our physical\nassessment and vital scan",
                    style: TextStyle(
                        color: Color(0xff2A2A2A),
                        fontSize: 13,
                        fontWeight: FontWeight.normal),
                  ),
                  Row(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
