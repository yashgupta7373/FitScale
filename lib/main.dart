import 'package:fit_scale/screens/splash_screen.dart';
import 'package:fit_scale/utility/app_theme.dart';
import 'package:fit_scale/utility/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      // const FitScaleApp()
    ChangeNotifierProvider(
        create: (context)=>ThemeProvider(),
      child: const FitScaleApp(),
    )
  );
}

class FitScaleApp extends StatelessWidget {
  const FitScaleApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitScale - BMI Calculator',
      theme: Provider.of<ThemeProvider>(context).themeData,
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      // themeMode: themeProvider.themeMode,
      home: const SplashScreen(),
    );
  }
}

