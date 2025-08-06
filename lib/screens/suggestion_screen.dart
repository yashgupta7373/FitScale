import 'package:flutter/material.dart';

class BmiSuggestion {
  final String emoji;
  final String motivation;
  final List<String> foodTips;
  final List<String> exerciseTips;

  BmiSuggestion({
    required this.emoji,
    required this.motivation,
    required this.foodTips,
    required this.exerciseTips,
  });
}

class SuggestionScreen extends StatelessWidget {
  final String bmi;
  final String userName;

  SuggestionScreen({required this.bmi, required this.userName});

  String getBMICategory(double bmi) {
    if (bmi < 16) return 'Severe Thinness';
    else if (bmi < 17) return 'Moderate Thinness';
    else if (bmi < 18.5) return 'Mild Thinness';
    else if (bmi < 25) return 'Normal';
    else if (bmi < 30) return 'Overweight';
    else if (bmi < 35) return 'Obese Class I';
    else if (bmi < 40) return 'Obese Class II';
    else return 'Obese Class III';
  }

  final Map<String, BmiSuggestion> suggestionMap = {
    'Severe Thinness': BmiSuggestion(
      emoji: '🧍‍♂️🍲',
      motivation: "Your body needs more strength! Let’s nourish it 💪",
      foodTips: [
        "Add calorie-rich foods: nuts, dairy, ghee 🥛🥜",
        "Frequent small meals + protein shakes 🍗",
      ],
      exerciseTips: [
        "Do light yoga 🧘",
        "Avoid overexertion; focus on gaining strength 💪",
      ],
    ),
    'Moderate Thinness': BmiSuggestion(
      emoji: '🍛🏋️',
      motivation: "You're getting there! Fuel up and train smart 🔥",
      foodTips: [
        "High-protein meals with carbs 🍚🍖",
        "Avoid skipping meals 🍽️",
      ],
      exerciseTips: [
        "Basic strength workouts 🏋️",
        "Daily walk and stretching 🧘‍♂️",
      ],
    ),
    'Mild Thinness': BmiSuggestion(
      emoji: '🍞💪',
      motivation: "Almost healthy – just a bit more push needed 🚀",
      foodTips: [
        "Add healthy fats and milk 🥛🧀",
        "Eat on time regularly ⏰",
      ],
      exerciseTips: [
        "Bodyweight exercises + light weights 🏋️‍♀️",
        "Avoid high-cardio activities for now ⛔",
      ],
    ),
    'Normal': BmiSuggestion(
      emoji: '🌟🎯',
      motivation: "Perfect! Maintain this balance and stay consistent 🌈",
      foodTips: [
        "Balanced meals: fruits, grains, protein 🥗🍗",
        "Stay hydrated 💧",
      ],
      exerciseTips: [
        "Mix of cardio + weights 🏃‍♂️🏋️‍♂️",
        "Try meditation or yoga 🧘",
      ],
    ),
    'Overweight': BmiSuggestion(
      emoji: '🥦🚴',
      motivation: "Let’s shed some weight and get fit together 💥",
      foodTips: [
        "Avoid sugar, fried food 🚫🍩",
        "Eat fiber and protein 🥦🍗",
      ],
      exerciseTips: [
        "Cardio + strength training 🏃‍♂️💪",
        "Walk daily, aim for 7k+ steps 👣",
      ],
    ),
    'Obese Class I': BmiSuggestion(
      emoji: '⚠️🔥',
      motivation: "Time to take charge. You can do this! 💯",
      foodTips: [
        "Switch to clean, home-cooked food 🍲",
        "Say no to soft drinks, sweets 🚫🥤",
      ],
      exerciseTips: [
        "Brisk walking + low impact workouts 🚶",
        "Start slowly, then add intensity gradually 🧗",
      ],
    ),
    'Obese Class II': BmiSuggestion(
      emoji: '🚨❤️',
      motivation: "Health alert! Let's rebuild your lifestyle, one step at a time 👣",
      foodTips: [
        "Avoid processed food completely 🚫🍔",
        "Consult a nutritionist if possible 🩺",
      ],
      exerciseTips: [
        "Do chair or pool exercises 💧",
        "Work with a trainer or doctor 👨‍⚕️",
      ],
    ),
    'Obese Class III': BmiSuggestion(
      emoji: '🏥🛑',
      motivation: "It’s serious, but not impossible. Start today – your body deserves it 🧠❤️",
      foodTips: [
        "Strict diet plan, focus on vegetables and protein 🥬🍗",
        "Smaller meals, more often 🍽️",
      ],
      exerciseTips: [
        "Very low-impact movements, under supervision 🧑‍⚕️",
        "Monitor heart rate and progress regularly 📉",
      ],
    ),
  };

  @override
  Widget build(BuildContext context) {
    final category = getBMICategory(double.parse(bmi));
    final suggestion = suggestionMap[category]!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi $userName 👋'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your BMI: ${bmi} ($category) ${suggestion.emoji}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              Text("💡 Motivation", style: _sectionTitle()),
              Text(suggestion.motivation, style: _contentText()),

              SizedBox(height: 20),
              Text("🍽️ Food Suggestions", style: _sectionTitle()),
              ...suggestion.foodTips.map((tip) => ListTile(
                leading: Icon(Icons.fastfood),
                title: Text(tip),
              )),

              SizedBox(height: 20),
              Text("🏋️ Exercise Suggestions", style: _sectionTitle()),
              ...suggestion.exerciseTips.map((tip) => ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text(tip),
              )),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _sectionTitle() => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.blueAccent,
  );

  TextStyle _contentText() => TextStyle(fontSize: 16);
}
