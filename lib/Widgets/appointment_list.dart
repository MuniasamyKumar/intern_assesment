import 'package:flutter/material.dart';

import 'custom_report_card.dart';

class AppointmentList extends StatelessWidget {
  const AppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffF6F6FB),
        ),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                    height: 300,
                    // width: double.infinity,
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        // childAspectRatio: 1.5,
                      ),
                      children: const [
                        CustomReportCard(
                          image: "assets/fi_6668816.png",
                          color: Color(0xffC6D9FF),
                          title: "Cancer 2nd Opinion",
                        ),
                        CustomReportCard(
                          image: "assets/Vector (1).png",
                          color: Color(0xffE9C6FF),
                          title: "Physiotherapy Appointment",
                        ),
                        CustomReportCard(
                          image: "assets/Vector (2).png",
                          color: Color(0xffFFD4C6),
                          title: "Fitness Appointment",
                        ),
                      ],
                    )),
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff232F58)),
                child: const Text(
                  "View All",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
