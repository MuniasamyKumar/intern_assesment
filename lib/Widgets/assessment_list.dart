import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'custom_ass_container.dart';

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
                  child: SizedBox(
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
      },
    );
  }
}
