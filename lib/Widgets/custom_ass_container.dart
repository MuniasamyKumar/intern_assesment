import 'package:flutter/material.dart';
import 'package:intern_assesment/Screens/assesment_view_page.dart';
import 'package:intern_assesment/constant.dart';

class CustomAssessmentContainer extends StatelessWidget {
  final Map<String, dynamic> data;

  const CustomAssessmentContainer({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
   

    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Container(
        height: 130,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: NetworkImage(data['imageUrl'])),
                    color: const Color.fromARGB(255, 255, 206, 132),
                    gradient: RadialGradient(colors: [
                      Colors.orange[100]!,
                      Colors.orange[200]!,
                      Colors.orange[100]!,
                    ]),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                width: MediaQuery.of(context).size.width / 3,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                SizedBox(
                  width: getResponsiveWidth(context),
                  child: Text(
                    data['title'],
                    style: const TextStyle(
                        color: Color(0xff222E58),
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: getResponsiveWidth(context),
                  child: Text(
                    data['content'],
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                        color: Color(0xff2A2A2A),
                        fontSize: 13,
                        overflow: TextOverflow.clip,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AssesmentViewPage(data: data)));
                  },
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
