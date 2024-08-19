import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'custom_workout_card.dart';

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
