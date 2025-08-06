import 'package:flutter/material.dart';

class AppColor {
  // Static common colors

  // Black
  static const Color black = Colors.black;
  static const Color black12 = Colors.black12;
  static const Color black26 = Colors.black26;
  static const Color black38 = Colors.black38;
  static const Color black45 = Colors.black45;
  static const Color black54 = Colors.black54;
  static const Color black87 = Colors.black87;

  // dark
  static const Color darkBlack = Color(0xFF000000);
  static const Color lightBlack = Color(0xE5100F0F);
  static const Color extraLightBlack = Color(0xCD434141);

  // gray


  //white
  static const Color darkWhite = Color(0xFFFFFFFF);
  static const Color white = Color(0xCBFFFFFF);
  static const Color lightWhite = Color(0x99FFFFFF);

  // Cream
  static const Color cream = Color(0xFFFAF7BA);
  static const Color creamLight = Color(0xFFF6EBC0);
  static const Color creamDark = Color(0xFFF3ED9A);
  static const Color border = Color(0xFFA3916F);
  static const Color buttonBg = Color(0xFFFFF8E1);
  static const Color buttonFg = Color(0xFFFFFDD0);
  static const Color dotColor1 = Color(0xFFE3C456);
  static const Color dotColor2 = Color(0xFFF6A121);
  static const Color appBarTitle = Color(0xFF4A3903);
  static const Color userName = Color(0xFF4A3903);

  // red
  static const Color red = Color(0xFFF17171);

  // color: Color(0xFFF6EBC0),



  // static const Color backgroundLight = Color(0xFFF5F5F5);
  // static const Color backgroundDark = Color(0xFF121212);
  static const Color textLight = Color(0xFF212121);
  static const Color textDark = Color(0xFFFFFFFF);
  static const Color warning = Color(0xFFFFA000);

  // static Color background1(BuildContext context)=> Theme.of(context).brightness == Brightness.dark
  //     ? AppColor.black
  //     : AppColor.bgLight;

  //  background Color
  static Color background(
      BuildContext context, {
        Color? light,
        Color? dark,
      }) {
    return Theme.of(context).brightness == Brightness.dark
        ? (dark ?? AppColor.lightBlack)
        : (light ?? AppColor.cream);
  }

  // Paragraph Color
  static Color paraColor(
      BuildContext context, {
        Color? light,
        Color? dark,
      }) {
    return Theme.of(context).brightness == Brightness.dark
        ? (dark ?? AppColor.lightBlack)
        : (light ?? AppColor.white);
  }

  // Border Color
  static Color borderColor(
      BuildContext context, {
        Color? light,
        Color? dark,
      }) {
    return Theme.of(context).brightness == Brightness.dark
        ? (dark ?? AppColor.white)
        : (light ?? AppColor.border);
  }

  //button color
  static Color buttonColor(
      BuildContext context, {
        Color? light,
        Color? dark,
      }) {
    return Theme.of(context).brightness == Brightness.dark
        ? (dark ?? AppColor.lightWhite)
        : (light ?? AppColor.buttonBg);
  }
}