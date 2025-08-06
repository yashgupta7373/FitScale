import 'package:fit_scale/utility/app_color.dart';
import 'package:flutter/material.dart';
import '../utility/text_style.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background(context, light: AppColor.creamDark),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png', height: 200),
          const SizedBox(height: 20),
          Text('FitScale', style: AppTextStyle.appName(context)),
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Your health matters. FitScale makes it easy to understand your body better with just a few taps. Check your BMI, track your fitness, and take charge of your wellness journey!',
              textAlign: TextAlign.center,
              style: AppTextStyle.paragraph(context),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "Let's begin 💪",
            style: AppTextStyle.paragraph(
              context,
              colorLight: AppColor.lightBlack,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
