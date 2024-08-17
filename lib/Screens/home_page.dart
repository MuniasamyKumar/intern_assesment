import 'package:flutter/material.dart';
import 'package:intern_assesment/Widgets/custom_ass_container.dart';
import '../Widgets/appbar.dart';
import '../Widgets/challenges_container.dart';
import '../Widgets/custom_head_line.dart';
import '../Widgets/custom_workout_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int i = 0;
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 241, 241, 250),
                  borderRadius: BorderRadius.circular(30)),
              child: TabBar(
                controller: _tabController,
                unselectedLabelColor: Color(0xff6B6B6B),
                labelColor: Colors.blue,
                indicator: BoxDecoration(
                  color: const Color.fromRGBO(
                    0,
                    97,
                    228,
                    1,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                tabs: [
                  Tab(
                      child: Text(
                    "Today's Trip",
                    style: TextStyle(
                        fontSize: 16,
                        // color: Colors.black,
                        fontWeight: FontWeight.w500),
                  )),
                  Tab(
                      child: Text(
                    "Trip History",
                    style: TextStyle(
                        fontSize: 16,
                        //  color: Colors.black,
                        fontWeight: FontWeight.w500),
                  )),
                ],
              ),
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              Text("data"),
              Text("data"),
            ],
          )),
          const CustomAssessmentContainer(),
          const CustomHeadLine(
            category: "Challenges",
          ),
          const ChallengesContainer(),
          const CustomHeadLine(
            category: "Workout Routines",
          ),
          SizedBox(
            height: 170,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: const [
                WorkoutCard(
                  title: 'Sweat Starter',
                  subtitle: 'Full Body',
                  difficulty: 'Medium',
                  tag: 'Lose Weight',
                  imageUrl: "assets/sd 1.png",
                ),
                WorkoutCard(
                  title: 'Core Crusher',
                  subtitle: 'Abs',
                  difficulty: 'Hard',
                  tag: 'Strength',
                  imageUrl: "assets/image 54.png",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
