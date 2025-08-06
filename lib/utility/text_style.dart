import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTextStyle {
  // Footer
  static TextStyle footer(BuildContext context) {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).textTheme.bodySmall!.color,
    );
  }

  //App Name
  static TextStyle appName(BuildContext context, {double fontSize = 40}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).textTheme.headlineLarge!.color,
    );
  }

  // Paragraph
  static TextStyle paragraph(
    BuildContext context, {
    double fontSize = 15,
    Color colorLight = AppColor.extraLightBlack,
    Color colorDark = AppColor.lightWhite,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: AppColor.paraColor(context, light: colorLight, dark: colorDark),
    );
  }

  // appBar
  static TextStyle appBar(
      BuildContext context, {
        double fontSize = 20,
        Color lightColor = AppColor.appBarTitle,
        Color darkColor = AppColor.white
      }) {
    return TextStyle(
        fontSize: fontSize,
        color: AppColor.paraColor(context, light: lightColor, dark: darkColor)
    );
  }

}
