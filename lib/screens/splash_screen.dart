import 'dart:async';
import 'package:fit_scale/screens/home_screen.dart';
import 'package:fit_scale/utility/text_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utility/app_color.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), _handleStartupLogic);
  }

  Future<void> _handleStartupLogic() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
      _navigateTo(const OnboardingScreen());
    } else {
      _navigateToHomeScreen(prefs);
    }
  }

  void _navigateTo(Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  void _navigateToHomeScreen(SharedPreferences prefs) {
    final String? name = prefs.getString('Name');
    final String displayName = (name == null || name.trim().isEmpty) ? 'User' : name;
    _navigateTo(HomeScreen(userName: displayName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background(context, light: AppColor.creamLight),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Splash.webp'),
                  const SizedBox(height: 10),
                  Text('FitScale', style: AppTextStyle.appName(context)),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text("from", style: AppTextStyle.footer(context)),
                  Text('YNS Group', style: AppTextStyle.footer(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
