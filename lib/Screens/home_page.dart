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
      body: Column(
        children: [
          SlideSwitcher(
            containerColor: Colors.grey[200]!,
            onSelect: (int index) => setState(() => switcherIndex = index),
            containerHeight: 50,
            containerWight: 450,
            indents: 5,
            children: [
              Text(
                'My Assessments',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight:
                      switcherIndex == 0 ? FontWeight.bold : FontWeight.w500,
                  color: switcherIndex == 0 ? Colors.blue[700] : Colors.grey,
                ),
              ),
              Text(
                'My Appointments',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight:
                      switcherIndex == 1 ? FontWeight.bold : FontWeight.w500,
                  color: switcherIndex == 1 ? Colors.blue[700] : Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
              child: switcherIndex == 0
                  ? const AssessmentList()
                  : const Text("data2")),
          // const CustomAssessmentContainer(),
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
          const CustomHeadLine(
            category: "Workout Routines",
          ),
          SizedBox(height: 170, child: WorkoutRoutinesList()),
        ],
      ),
    );
  }
}

class AppointmentList extends StatelessWidget {
  const AppointmentList({super.key});

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

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.75,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            var item = items[index].data() as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomReportCard(),
            );
          },
        );
      },
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

        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            var item = items[index].data() as Map<String, dynamic>;
            return ListTile(
                title: CustomAssessmentContainer(
              content: item['content'],
              imageUrl: item['imageUrl'],
              title: item['title'],
            ));
          },
        );
      },
    );
  }
}
