import 'package:flutter/material.dart';

import '../utility/app_color.dart';
import '../utility/text_style.dart';

class NameScreen extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;

  const NameScreen({required this.controller, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: AppColor.borderColor(context)),
    );

    return Scaffold(
      backgroundColor: AppColor.background(context, light: AppColor.creamDark),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  // image
                  Image.asset('assets/images/HiGIF.gif', height: screenHeight*0.35),
                  // title
                  Text(
                    'Hey there!',
                    style: AppTextStyle.appName(context, fontSize: 25)
                  ),
                  const SizedBox(height: 40),
                  // Paragraph
                  Text(
                    'What should we call you?',
                    style: AppTextStyle.paragraph(context, fontSize: 18,
                        // color: Colors.black54
                    ),
                  ),
                  const SizedBox(height: 20),
                  // inputBox & button
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: 'Krishna',
                              hintStyle: AppTextStyle.paragraph(context, colorDark: AppColor.extraLightBlack),
                              labelText: 'Enter Your Name',
                              labelStyle: AppTextStyle.paragraph(context, colorDark: AppColor.white),
                              enabledBorder: border,
                              focusedBorder: border,
                              disabledBorder: border,
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        ElevatedButton(
                          onPressed: onSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.buttonColor(context, light: AppColor.cream),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Icon(Icons.arrow_forward, size: 30, color: AppColor.buttonColor(context, light: AppColor.border, dark: AppColor.darkBlack)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
