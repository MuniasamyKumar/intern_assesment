import 'package:flutter/material.dart';
import 'package:intern_assesment/Widgets/custom_ass_container.dart';
import 'package:slide_switcher/slide_switcher.dart';
import '../Widgets/appbar.dart';
import '../Widgets/challenges_container.dart';
import '../Widgets/custom_head_line.dart';
import '../Widgets/custom_report_card.dart';
import '../Widgets/custom_workout_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'assesment_view_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int i = 0;
  int switcherIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: SlideSwitcher(
                      containerColor: const Color(0xffF6F6FB),
                      onSelect: (int index) =>
                          setState(() => switcherIndex = index),
                      containerHeight: 50,
                      containerWight: 350,
                      indents: 5,
                      children: [
                        Text(
                          'My Assessments',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: switcherIndex == 0
                                ? FontWeight.bold
                                : FontWeight.w500,
                            color: switcherIndex == 0
                                ? Colors.blue[700]
                                : Colors.grey,
                          ),
                        ),
                        Text(
                          'My Appointments',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: switcherIndex == 1
                                ? FontWeight.bold
                                : FontWeight.w500,
                            color: switcherIndex == 1
                                ? Colors.blue[700]
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
                height: 400,
                child: switcherIndex == 0
                    ? const AssessmentList()
                    : const AppointmentList()),
            const CustomHeadLine(
              category: "Challenges",
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Challenges')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No data found'));
                  }
                  final item =
                      snapshot.data!.docs.first.data() as Map<String, dynamic>;
                  return ChallengesContainer(
                    title: item['title'],
                    imageUrl: item['imageUrl'],
                    completed: item['completed'],
                    task: item['task'],
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            const CustomHeadLine(
              category: "Workout Routines",
            ),
            const SizedBox(height: 170, child: WorkoutRoutinesList()),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

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
                child: Container(
                    height: 300,
                    // width: double.infinity,
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        // childAspectRatio: 50,
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
                    backgroundColor: Color(0xff232F58)),
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

class WorkoutRoutinesList extends StatelessWidget {
  const WorkoutRoutinesList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('WorkoutRoutines').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No data found'));
        }

        final items = snapshot.data!.docs;

        return ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = items[index].data() as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: WorkoutCard(
                subtitle: item['subtitle'],
                imageUrl: item['imageUrl'],
                title: item['title'],
                difficulty: item['difficulty'],
                tag: item['tag'],
              ),
            );
          },
        );
      },
    );
  }
}

class AssessmentList extends StatelessWidget {
  const AssessmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Assesments').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No data found'));
        }

        final items = snapshot.data!.docs;

        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
          child: Container(
            // height: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffF6F6FB),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    height: 300,
                    // width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var item = items[index].data() as Map<String, dynamic>;
                        return CustomAssessmentContainer(data: item);
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff232F58)),
                    child: const Text(
                      "View All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
