import 'package:flutter/material.dart';

import '../main.dart';
import '../models/fitness_profile.dart';
import '../utils/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/bottom_nav.dart';
import 'ai_chat_screen.dart';
import 'dashboard_screen.dart';
import 'profile_screen.dart';
import 'workout_plan_screen.dart';

class GoalSetupScreen extends StatefulWidget {
  const GoalSetupScreen({super.key});

  static const routeName = '/goals';

  @override
  State<GoalSetupScreen> createState() => _GoalSetupScreenState();
}

class _GoalSetupScreenState extends State<GoalSetupScreen> {
  late final TextEditingController ageController;
  late final TextEditingController heightController;
  late final TextEditingController weightController;
  String goal = 'Lose Weight';
  String workoutDays = '3 days';
  String dietPreference = 'Balanced';

  @override
  void initState() {
    super.initState();
    final profile = AppStateScope.read(context).profile;
    ageController = TextEditingController(text: profile.age);
    heightController = TextEditingController(text: profile.height);
    weightController = TextEditingController(text: profile.weight);
    goal = profile.goal;
    workoutDays = profile.workoutDays;
    dietPreference = profile.dietPreference;
  }

  @override
  void dispose() {
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Goal Setup'), backgroundColor: AppColors.background, elevation: 0),
      bottomNavigationBar: FitBottomNav(
        currentIndex: 1,
        onTap: (index) {
          final routes = [DashboardScreen.routeName, GoalSetupScreen.routeName, AiChatScreen.routeName, ProfileScreen.routeName];
          if (index != 1) Navigator.pushNamed(context, routes[index]);
        },
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextField(controller: ageController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Age')),
            const SizedBox(height: 14),
            TextField(controller: heightController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Height (cm)')),
            const SizedBox(height: 14),
            TextField(controller: weightController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Weight (kg)')),
            const SizedBox(height: 14),
            _Dropdown(label: 'Fitness goal', value: goal, items: const ['Lose Weight', 'Build Muscle', 'Stay Fit'], onChanged: (value) => setState(() => goal = value)),
            const SizedBox(height: 14),
            _Dropdown(label: 'Workout days per week', value: workoutDays, items: const ['2 days', '3 days', '4 days', '5 days'], onChanged: (value) => setState(() => workoutDays = value)),
            const SizedBox(height: 14),
            _Dropdown(label: 'Diet preference', value: dietPreference, items: const ['Balanced', 'Vegetarian', 'High Protein', 'Low Carb'], onChanged: (value) => setState(() => dietPreference = value)),
            const SizedBox(height: 24),
            AppButton(
              text: 'Generate My Plan',
              onPressed: () {
                AppStateScope.of(context).saveProfile(FitnessProfile(age: ageController.text, height: heightController.text, weight: weightController.text, goal: goal, workoutDays: workoutDays, dietPreference: dietPreference));
                Navigator.pushNamed(context, WorkoutPlanScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Dropdown extends StatelessWidget {
  const _Dropdown({required this.label, required this.value, required this.items, required this.onChanged});
  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(labelText: label),
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: (value) {
        if (value != null) onChanged(value);
      },
    );
  }
}
