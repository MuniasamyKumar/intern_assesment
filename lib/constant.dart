import 'package:flutter/material.dart';

double getResponsiveWidth(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 600) {
    // Mobile
    return 195;
  } else if (screenWidth < 1200) {
    // Tablet
    return 400;
  } else {
    // Laptop/Web
    return 300;
  }
}

double getResponsiveHeight(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 600) {
    return MediaQuery.of(context).size.height - 200;
  } else {
    return MediaQuery.of(context).size.height - 20;
  }
}

double getResponsiveHeight1(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 600) {
    return MediaQuery.of(context).size.height - 550;
  } else {
    return MediaQuery.of(context).size.height - 400;
  }
}

double getImgResponsiveHeight(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 600) {
    return 100;
  } else {
    return 150;
  }
}

double getImgResponsiveWidth(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 600) {
    return 130;
  } else {
    return 250;
  }
}
