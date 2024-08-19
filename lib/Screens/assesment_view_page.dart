import 'package:flutter/material.dart';
import '../Widgets/custom_circle_avatar.dart';
import '../Widgets/custom_step_text.dart';
import '../constant.dart';

class AssesmentViewPage extends StatefulWidget {
  final Map<String, dynamic> data;
  const AssesmentViewPage({super.key, required this.data});
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
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: getResponsiveWidth(context),
                          child: Text(
                            widget.data['title'],
                            style: const TextStyle(
                                color: Color(0xff222E58),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer_outlined,
                                  size: 20,
                                  color: Color(0xff222E58),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "4 min",
                                  style: TextStyle(
                                    fontSize: 14,
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
                      child: Hero(
                        tag: 'img',
                        child: SizedBox(
                            height: getResponsiveWidth(context) - 30,
                            width: getResponsiveWidth(context) - 30,
                            child: Image.network(widget.data['imageUrl'])),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height * 3,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCircleAvatar(
                          img: "assets/fi_245305.png",
                          data: widget.data['reports'][0],
                        ),
                        CustomCircleAvatar(
                          img: "assets/Group.png",
                          data: widget.data['reports'][1],
                        ),
                        CustomCircleAvatar(
                          img: "assets/Group (1).png",
                          data: widget.data['reports'][2],
                        ),
                        CustomCircleAvatar(
                          img: "assets/002---Fast-Message.png",
                          data: widget.data['reports'][3],
                        )
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
                        height: getResponsiveHeight(context),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 300,
                                width: double.infinity,
                                child: SizedBox(
                                  height: 200,
                                  width: 400,
                                  child: Image.asset("assets/Untitled-1 3.png"),
                                ),
                              ),
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
                                height: 20,
                              ),
                              CustomStepText(
                                text: widget.data['steps'][0],
                              ),
                              CustomStepText(
                                text: widget.data['steps'][1],
                              ),
                              CustomStepText(
                                text: widget.data['steps'][2],
                              ),
                              CustomStepText(
                                text: widget.data['steps'][3],
                              ),
                              CustomStepText(
                                text: widget.data['steps'][4],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 15, bottom: 10),
                      child: Text(
                        "Benefits",
                        style: TextStyle(
                            color: Color(0xff222E58),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        height: getResponsiveHeight1(context),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              CustomStepText(
                                text: widget.data['steps'][5],
                              ),
                              CustomStepText(
                                text: widget.data['steps'][6],
                              ),
                              CustomStepText(
                                text: widget.data['steps'][7],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 60),
                              backgroundColor: const Color(0xff255FD5)),
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 35,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Start Assesment",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
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
