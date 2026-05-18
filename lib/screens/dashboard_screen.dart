import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/app_colors.dart';
import '../widgets/app_card.dart';
import '../widgets/bottom_nav.dart';
import 'ai_chat_screen.dart';
import 'goal_setup_screen.dart';
import 'meal_plan_screen.dart';
import 'posture_check_screen.dart';
import 'profile_screen.dart';
import 'progress_tracker_screen.dart';
import 'workout_plan_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: FitBottomNav(
        currentIndex: 0,
        onTap: (index) {
          final routes = [DashboardScreen.routeName, GoalSetupScreen.routeName, AiChatScreen.routeName, ProfileScreen.routeName];
          if (index != 0) Navigator.pushNamed(context, routes[index]);
        },
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text('Hello, Farooq', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: AppColors.textDark)),
            const SizedBox(height: 6),
            const Text('Ready for a healthy day?', style: TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 20),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Today’s Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _SummaryItem(label: 'Calories left', value: '680'),
                      _SummaryItem(label: 'Workout minutes', value: '35'),
                      _SummaryItem(label: 'Goal progress', value: '62%'),
                    ],
                  ),
                  const SizedBox(height: 14),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: const LinearProgressIndicator(value: .62, minHeight: 10, backgroundColor: AppColors.primaryLight),
                  ),
                  const SizedBox(height: 8),
                  Text('Workouts completed this week: ${appState.workoutsCompletedThisWeek}', style: const TextStyle(color: AppColors.textMuted)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: .98,
              children: [
                _FeatureCard(title: 'Workout Plan', icon: Icons.fitness_center, route: WorkoutPlanScreen.routeName),
                _FeatureCard(title: 'Meal Plan', icon: Icons.restaurant_menu, route: MealPlanScreen.routeName),
                _FeatureCard(title: 'Progress', icon: Icons.show_chart, route: ProgressTrackerScreen.routeName),
                _FeatureCard(title: 'AI Coach', icon: Icons.smart_toy_outlined, route: AiChatScreen.routeName),
                _FeatureCard(title: 'Posture Check', icon: Icons.accessibility_new, route: PostureCheckScreen.routeName),
                _FeatureCard(title: 'Setup Goals', icon: Icons.flag_outlined, route: GoalSetupScreen.routeName),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.primary)),
        const SizedBox(height: 4),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({required this.title, required this.icon, required this.route});
  final String title;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(backgroundColor: AppColors.primaryLight, child: Icon(icon, color: AppColors.primary)),
          const SizedBox(height: 14),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}
