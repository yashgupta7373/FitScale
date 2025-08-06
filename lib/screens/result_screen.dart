import 'package:fit_scale/screens/suggestion_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../utility/app_color.dart';
import '../utility/text_style.dart';

class ResultScreen extends StatelessWidget {
  final String age, height, weight, userName, gender, bmi;
  ResultScreen({
    super.key,
    required this.userName,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
    required this.bmi,
  });

  TextStyle resultStyle(Color color) => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: color,
  );

  TextSpan getResultText() {
    double bmiValue = double.parse(bmi);
    if (bmiValue < 16) {
      return TextSpan(text: 'Severe Thinness', style: resultStyle(Colors.yellow.shade700));
    } else if (bmiValue < 17) {
      return TextSpan(text: 'Moderate Thinness', style: resultStyle(Colors.yellow.shade700));
    } else if (bmiValue < 18.5) {
      return TextSpan(text: 'Mild Thinness', style: resultStyle(Colors.yellow.shade700));
    } else if (bmiValue < 25) {
      return TextSpan(text: 'Normal', style: resultStyle(Colors.green));
    } else if (bmiValue < 30) {
      return TextSpan(text: 'Overweight', style: resultStyle(Colors.orange));
    } else if (bmiValue < 35) {
      return TextSpan(text: 'Obese Class I', style: resultStyle(Colors.red.shade400));
    } else if (bmiValue < 40) {
      return TextSpan(text: 'Obese Class II', style: resultStyle(Colors.red.shade600));
    } else {
      return TextSpan(text: 'Obese Class III', style: resultStyle(Colors.red.shade800));
    }
  }

  Widget buildIndicator(String label, String range, Color color) {
    return SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 1, child: CircleAvatar(backgroundColor: color)),
          SizedBox(width: 5),
          Expanded(
            flex: 10,
            child: Text(label,
                style: TextStyle(fontSize: 15)
            ),
          ),
          Expanded(
            flex: 10,
            child: Text(range,
                textAlign: TextAlign.end,
              style: TextStyle(fontSize: 15)
              ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final double bmiValue = double.parse(bmi);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background(context, light: AppColor.creamLight, dark: AppColor.darkBlack),
        title: Text("Your result", style: AppTextStyle.appBar(context)),
      ),
      body: Container(
        height: double.infinity,
        color: AppColor.background(context, light: AppColor.creamLight, dark: AppColor.darkBlack),
        child: Column(
          children: [
            // BMI Gauge
            Expanded(
              flex: 5,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    radiusFactor: 1,
                    canScaleToFit: true,
                    minimum: 0,
                    maximum: 51,
                    interval: 1,
                    startAngle: 180,
                    endAngle: 0,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.33,
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    onLabelCreated: (AxisLabelCreatedArgs args) {
                      Map<String, String> customLabels = {
                        '0': '0',
                        '16': '16',
                        // '17': '17',
                        '18': '18.5',
                        '25': '25',
                        '30': '30',
                        '35': '35',
                        '40': '40',
                        '50': '50',
                      };
                      args.text = customLabels[args.text] ?? '';
                    },
                    ranges: [
                    [0.0, 15.9, Colors.yellow.shade400],
                    [16.0, 16.9, Colors.yellow.shade600],
                    [17.0, 18.4, Colors.yellow.shade800],
                    [18.5, 24.9, Colors.green],
                    [25.0, 29.9, Colors.orange.shade700],
                    [30.0, 34.9, Colors.red.shade500],
                    [35.0, 39.9, Colors.red.shade700],
                    [40.0, 51.0, Colors.red.shade900],
                  ].map((r) => GaugeRange(
                    startValue: r[0] as double,
                    endValue: r[1] as double,
                    color: r[2] as Color,
                    startWidth: 55,
                    endWidth: 55,
                  )).toList(),
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: bmiValue,
                        enableAnimation: true,
                        needleLength: 0.85,
                        needleStartWidth: 0.1,
                        needleEndWidth: 7,
                        knobStyle: KnobStyle(knobRadius: 0.04),
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '$bmiValue',
                                style: AppTextStyle.paragraph(context, fontSize: 30, fontWeight: FontWeight.w600, colorDark: AppColor.red, colorLight: AppColor.red)
                              ),
                              TextSpan(
                                text: ' kg/m²',
                                style: AppTextStyle.paragraph(context, fontSize: 19, fontWeight: FontWeight.w400, colorDark: AppColor.lightWhite, colorLight: AppColor.black54)
                              ),
                            ],
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.25,
                      ),
                      ...["UnderWeight", "Normal", "OverWeight", "Obesity"].asMap().entries.map(
                            (entry) => GaugeAnnotation(
                          widget: Transform.rotate(
                            angle: [-1.09, -0.25, 0.08, 0.87][entry.key],
                            child: Text(entry.value,
                                style: TextStyle(fontSize: 12)),
                          ),
                          angle: [210.0, 255.0, 277.0, 320.0][entry.key],
                          positionFactor: 1.06,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // result
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Guess What.?',
                style: AppTextStyle.paragraph(context, fontSize: 25, fontWeight: FontWeight.w400, colorDark: AppColor.white, colorLight: AppColor.black87)
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Your BMI results are ',
                      style: AppTextStyle.paragraph(context, fontSize: 17, fontWeight: FontWeight.w400, colorDark: AppColor.white, colorLight: AppColor.black87)
                        ),
                        getResultText(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // user info row
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 40,
                ),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    // color: Color(0xD3F4D656),
                    color: AppColor.buttonColor(context, dark: AppColor.extraLightBlack),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ...[
                              ['Age', age],
                              ['Height (in)', height],
                              ['Weight (kg)', weight],
                            ].asMap().entries.expand((entry) {
                              int index = entry.key;
                              var item = entry.value;
                              return [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(item[0],
                                          style: AppTextStyle.paragraph(context, colorLight: AppColor.extraLightBlack, colorDark: AppColor.white),
                                          ),
                                      Text(item[1],
                                        style: AppTextStyle.paragraph(context, colorLight: AppColor.extraLightBlack, colorDark: AppColor.white),
                                      )],
                                  ),
                                ),
                                // Add divider after first and second item only
                                if (index != 2)
                                  VerticalDivider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    width: 0, // space taken by the divider
                                    indent: 12, // top spacing
                                    endIndent: 12, // bo
                                  ),
                              ];
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            // Indicators
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      buildIndicator('Severe Thinness', '<16', Colors.yellow.shade400),
                      buildIndicator('Moderate Thinness', '16 - 17', Colors.yellow.shade600),
                      buildIndicator('Mild Thinness', '17 - 18.5', Colors.yellow.shade800),
                      buildIndicator('Normal', '18.5 - 25', Colors.green),
                      buildIndicator('Overweight', '25 - 30', Colors.orange),
                      buildIndicator('Obese Class I', '30 - 35', Colors.red.shade500),
                      buildIndicator('Obese Class II', '35 - 40', Colors.red.shade700),
                      buildIndicator('Obese Class III', '>40', Colors.red.shade900),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            // Button
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ['Suggestion', ()=>Navigator.push(context,MaterialPageRoute(builder: (context) => SuggestionScreen(bmi: bmi, userName: userName,)))],
                  ['Retry', () => Navigator.pop(context)],
                ].map((btn) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: btn[1] as void Function(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.buttonColor(context, dark: AppColor.extraLightBlack),
                          foregroundColor: Colors.black87,
                        ),
                        child: Text(btn[0] as String, style: AppTextStyle.paragraph(context, colorDark: AppColor.white)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}