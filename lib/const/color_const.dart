import 'package:flutter/material.dart';

class ColorTheme {
  ColorTheme._privateConstructor();

  static final ColorTheme _instance = ColorTheme._privateConstructor();

  factory ColorTheme() {
    return _instance;
  }

  // Basic Colors
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kBlack = Colors.black;
  static const Color kRed = Colors.red;
  static const Color kYellow = Colors.yellow;
  static const Color kGrey = Colors.grey;
  static const Color kBlue = Color(0xFFE6F6FE);
  static const Color kCherryRed = Color(0xFFEA5455);
  static const Color kRedError = Color.fromARGB(255, 252, 205, 205);

  // Scaffold and Background Colors
  static const Color kScaffoldColor = Color(0xFFF8F7FA);
  static const Color kBackGroundGrey = Color(0xfff1f1f2);

  // Border Colors
  static const Color kBorderColor = Color(0xFFDBDADE);
  static const Color kFocusedBorderColor = Color(0xFF6e6d6f);

  // Text Colors
  static const Color kHintTextColor = Color(0xFF808080);
  static const Color kMicrosoftText = Color(0xFF5E5E5E);

  // Hint Colors
  static const Color kHintColor = Color(0xFFA8AAAE);

  // Miscellaneous Colors
  static const Color kTableHeader = Color(0xFFeeeeef);

  // Notification Colors
  static const kErrorColor = Color(0xFFE55E5E);
  static const kSuccessColor = Color(0xFF32BA7C);
  static const kWarnColor = Color(0xFFA88944);

  // Graph Colors
  static const kGraphPurpleColor = Color(0xFF5470C6);
  static const kGraphGreenColor = Color(0xFF28C76F);
  static const kGraphYellowColor = Color(0xFFFDCF17);
  static const kGraphOrangeColor = Color(0xFFFF9F43);
  static const kTextBlueColor = Color(0xFF1376F8);
  static const kLightBlueColor = Color(0xFF25B4F8);
  static const kDarkBlueColor = Color(0xFF1F81B9);
  static const kOGBlueColor = Colors.blue;

  // Report Colors
  static const kReportLightGreen = Color(0xFF6BBDAE);
  static const kReportBlue = Color(0xFF5AB4B4);
  static const kReportYellow = Color(0xFFBCA66C);
  static const kReportViolet = Color(0xFF9B59B6);
  static const kGreen = Color(0xFFd4edda);
  static const kReportOccurYellow = Color(0xFF8a753e);
  static const kReportDarkYellow = Color(0xFFC1AC87);
  static const kReportSkyBlue = Color(0xFF57b6fa);
  static const kReportPeach = Color(0xFFE9967A); // Peach
  static const kReportLavender = Color(0xFF93A0DB); // Lavender
  static const kReportCoral = Color(0xFFFFAF50); // Coral

  // Shimmer Colors
  static const kShimmerBaseColor = Color(0xFFEEEEEE);
  static const kShimmerHighlightColor = Color(0xFFFAFAFA);
}

class FontTheme {
  FontTheme._privateConstructor();

  static final FontTheme _instance = FontTheme._privateConstructor();

  factory FontTheme() {
    return _instance;
  }

  static String themeFontFamily = "notosans";

  static const FontWeight notoRegular = FontWeight.w400;
  static const FontWeight notoMedium = FontWeight.w500;
  static const FontWeight notoSemiBold = FontWeight.w600;
  static const FontWeight notoBold = FontWeight.w700;
  static const FontWeight notoBlack = FontWeight.w900;
}
