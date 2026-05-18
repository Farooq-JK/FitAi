import 'package:flutter/material.dart';

import '../models/meal_item.dart';
import '../services/ai_service.dart';
import '../utils/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_card.dart';
import '../widgets/screen_scaffold.dart';

class MealPlanScreen extends StatefulWidget {
  const MealPlanScreen({super.key});

  static const routeName = '/meal-plan';

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  final AiService aiService = AiService();
  late Future<List<MealItem>> mealsFuture;

  @override
  void initState() {
    super.initState();
    mealsFuture = aiService.generateMealPlan();
  }

  void refreshPlan() {
    setState(() => mealsFuture = aiService.generateMealPlan());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'AI Meal Plan',
      children: [
        const Text('Dummy AI-generated meal ideas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
        const SizedBox(height: 16),
        FutureBuilder<List<MealItem>>(
          future: mealsFuture,
          builder: (context, snapshot) {
            final meals = snapshot.data ?? [];
            return Column(
              children: meals.map((meal) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AppCard(
                  child: Row(
                    children: [
                      const CircleAvatar(backgroundColor: AppColors.primaryLight, child: Icon(Icons.restaurant, color: AppColors.primary)),
                      const SizedBox(width: 14),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(meal.name, style: const TextStyle(fontWeight: FontWeight.w800)), Text(meal.description, style: const TextStyle(color: AppColors.textMuted))])),
                      Text('${meal.calories} kcal', style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.primary)),
                    ],
                  ),
                ),
              )).toList(),
            );
          },
        ),
        AppButton(text: 'Generate New Meal Plan', icon: Icons.refresh, onPressed: refreshPlan),
      ],
    );
  }
}
