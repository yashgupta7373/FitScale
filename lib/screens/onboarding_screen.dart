import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fit_scale/screens/home_screen.dart';
import '../utility/app_color.dart';
import 'intro_screen.dart';
import 'name_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  final TextEditingController nameField = TextEditingController();
  final PageController _controller = PageController();
  bool onLastPage = false;

  void _saveNameAndNavigate() async {
    String name = nameField.text.trim().isEmpty ? "User" : nameField.text.trim();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Name', name);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen(userName: name)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() => onLastPage = (index == 1));
            },
            children: [
              IntroScreen(),
              NameScreen(controller: nameField, onSubmit: _saveNameAndNavigate),
            ],
          ),

          // Bottom navigation and indicators
          Positioned(
            bottom: 25,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (!onLastPage)
                  GestureDetector(
                    onTap: () => _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    ),
                    child: const Text("Skip"),
                  )
                else
                  const SizedBox(width: 48), // Placeholder for layout balance

                SmoothPageIndicator(
                  controller: _controller,
                  count: 2,
                  effect: WormEffect(
                    dotColor: AppColor.background(context, light: AppColor.dotColor1, dark: AppColor.lightWhite),
                    activeDotColor: AppColor.background(context, light: AppColor.dotColor2, dark: AppColor.white),
                    // dotColor: Color(0xFFE3C456),
                    // activeDotColor: Color(0xFFF6A121),
                    dotHeight: 13,
                    dotWidth: 15,
                  ),
                ),

                GestureDetector(
                  onTap: onLastPage
                      ? _saveNameAndNavigate
                      : () => _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  ),
                  child: Text(onLastPage ? "Done" : "Next"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
