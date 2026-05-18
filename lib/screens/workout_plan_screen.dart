import 'package:flutter/material.dart';

import '../main.dart';
import '../models/workout_item.dart';
import '../services/ai_service.dart';
import '../utils/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_card.dart';
import '../widgets/screen_scaffold.dart';

class WorkoutPlanScreen extends StatefulWidget {
  const WorkoutPlanScreen({super.key});

  static const routeName = '/workout-plan';

  @override
  State<WorkoutPlanScreen> createState() => _WorkoutPlanScreenState();
}

class _WorkoutPlanScreenState extends State<WorkoutPlanScreen> {
  final AiService aiService = AiService();
  late Future<List<WorkoutItem>> workoutFuture;

  @override
  void initState() {
    super.initState();
    workoutFuture = aiService.generateWorkoutPlan();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'AI Workout Plan',
      children: [
        const Text('Daily beginner plan', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
        const SizedBox(height: 16),
        FutureBuilder<List<WorkoutItem>>(
          future: workoutFuture,
          builder: (context, snapshot) {
            final workouts = snapshot.data ?? [];
            return Column(
              children: workouts.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AppCard(child: ListTile(leading: Text(item.icon, style: const TextStyle(fontSize: 26)), title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.w800)), subtitle: Text(item.subtitle))),
              )).toList(),
            );
          },
        ),
        const SizedBox(height: 10),
        AppButton(
          text: 'Mark as Completed',
          icon: Icons.check_circle_outline,
          onPressed: () {
            AppStateScope.of(context).markWorkoutCompleted();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Workout completed!')));
          },
        ),
      ],
    );
  }
}
