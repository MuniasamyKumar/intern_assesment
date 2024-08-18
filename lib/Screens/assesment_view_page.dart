import 'package:flutter/material.dart';

import '../Widgets/custom_report_card.dart';

class AssesmentViewPage extends StatefulWidget {
  const AssesmentViewPage({super.key});
  @override
  State<AssesmentViewPage> createState() => _AssesmentViewPageState();
}

class _AssesmentViewPageState extends State<AssesmentViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Rectangle 2746.png"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Health Risk \nAssessment",
                        style: TextStyle(
                            color: Color(0xff222E58),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        child: const SizedBox(
                          height: 25,
                          width: 75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.timer_outlined,
                                size: 20,
                                color: Color(0xff222E58),
                              ),
                              Text(
                                "4 min",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff222E58),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset("assets/image 216.png")),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height + 200,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20, bottom: 15),
                      child: Text(
                        "What do you get ?",
                        style: TextStyle(
                            color: Color(0xff222E58),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCircleAvatar(),
                        CustomCircleAvatar(),
                        CustomCircleAvatar(),
                        CustomCircleAvatar(),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 15, bottom: 10),
                      child: Text(
                        "How we do it?",
                        style: TextStyle(
                            color: Color(0xff222E58),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        height: 650,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shield_moon_outlined,
                                      color: Colors.green,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "We do not store or share your personal data",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "1.Ensure that you are in a well-lit space",
                                style: TextStyle(fontSize: 18, height: 2),
                              ),
                              const Text(
                                "2.Allow camera access and place your device against a stable object or wall ",
                                style: TextStyle(fontSize: 18, height: 2),
                              ),
                              const Text(
                                "3.Avoiding wearing baggy clothes",
                                style: TextStyle(fontSize: 18, height: 2),
                              ),
                              const Text(
                                "4.Make sure you exercise as per the instruction provided by the trainer Watch the short preview before each exercise",
                                style: TextStyle(fontSize: 18),
                              ),
                             CustomReportCard()
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
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
            height: 80,
            width: 80,
            color: Colors.white,
            child: Center(
              child: SizedBox(
                height: 35,
                width: 35,
                child: Image.asset(
                  "assets/fi_245305.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        const Text(
          "Key Body\n  Vitals",
          style:
              TextStyle(color: Color(0xff303030), fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
