import 'package:flutter/material.dart';
import 'package:slide_switcher/slide_switcher.dart';
import '../Widgets/appbar.dart';
import '../Widgets/appointment_list.dart';
import '../Widgets/assessment_list.dart';
import '../Widgets/challenges_container.dart';
import '../Widgets/custom_head_line.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Widgets/workout_rout_list.dart';

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
              child: SizedBox(
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
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
