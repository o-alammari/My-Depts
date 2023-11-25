import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
// const primaryClr = bluishClr;
const primaryClr = Color.fromARGB(255, 244, 91, 25);
// const primaryClr = Color.fromARGB(255, 0, 33, 90);
// const primaryClr = Color(0xffEF8262);

const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static Color backgroundColor = Colors.grey[300]!;

  // static const Color fontColor = Color.fromARGB(255, 27, 65, 146);
  static const Color fontColor = Color.fromARGB(255, 10, 52, 143);
  static const Color backgroundColorButton = Color.fromARGB(255, 27, 65, 146);
  // static const Color fontColor = Color.fromARGB(255, 0, 33, 90);
  static final light = ThemeData(
    primaryColor: primaryClr,
    // backgroundColor: Colors.white,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    // backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}

TextStyle get titleAppBarStyle {
  return const TextStyle(
    fontSize: 20,
    // color: Colors.black,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

TextStyle get titleBottomSheetStyle {
  return const TextStyle(
    fontSize: 20,
    // color: Colors.black,
    color: Themes.fontColor,
    fontWeight: FontWeight.bold,
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      // color: Get.isDarkMode ? Colors.white : Colors.black,
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      // color: Get.isDarkMode ? Colors.white : Colors.black,
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle get titleStyle1 {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      // color: Get.isDarkMode ? Colors.white : Colors.black,
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      // color: Get.isDarkMode ? Colors.white : Colors.black,
      // color: Color.fromARGB(255, 27, 65, 146),
      color: Themes.fontColor,
      fontSize: 18,
      fontWeight: FontWeight.w800,
    ),
  );
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      // color: Get.isDarkMode ? Colors.white : Colors.black,
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );
}

TextStyle get bodyStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      // color: Get.isDarkMode ? Colors.white : Colors.black,
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
}

TextStyle get body2Style {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      // color: Get.isDarkMode ? Colors.grey[200] : Colors.black,
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
}
