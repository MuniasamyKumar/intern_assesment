import 'package:flutter/material.dart';
import 'package:intern_assesment/Screens/home_page.dart';

import 'Screens/assesment_view_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      home: AssesmentViewPage(),
    );
  }
}
