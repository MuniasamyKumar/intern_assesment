import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../constant.dart';

class ChallengesContainer extends StatelessWidget {
  final String title;
  final String task;
  final String imageUrl;
  final String completed;
  const ChallengesContainer({
    super.key,
    required this.title,
    required this.task,
    required this.imageUrl,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                  image: AssetImage("assets/Rectangle 2687.png"),
                  fit: BoxFit.cover)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Color(0xff2B7A71),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 25,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xff2B7A71),
                      ),
                      child: Center(
                          child: Text(
                        task,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                    LinearPercentIndicator(
                      padding: const EdgeInsets.all(0),
                      barRadius: const Radius.circular(10),
                      backgroundColor: Colors.white,
                      animation: true,
                      lineHeight: 13.0,
                      animationDuration: 2000,
                      width: MediaQuery.of(context).size.width / 2,
                      percent: 0.5,
                      progressColor: const Color(0xffFF88A5),
                    ),
                    Row(
                      children: [
                        Text(
                          completed,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Complete",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                    Container(
                      height: 35,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.play_circle,
                            color: Color(0xff255FD5),
                          ),
                          Text(
                            "Continue",
                            style: TextStyle(
                                color: Color(0xff255FD5),
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  width: getImgResponsiveWidth(context),
                  height: getImgResponsiveHeight(context),
                  child: const Image(
                    image: AssetImage("assets/image 53.png"),
                    fit: BoxFit.fill,
                  ))
            ],
          )),
    );
  }
}
