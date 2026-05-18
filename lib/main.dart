import 'package:flutter/material.dart';

import 'screens/ai_chat_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/goal_setup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/meal_plan_screen.dart';
import 'screens/posture_check_screen.dart';
import 'screens/posture_result_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/progress_tracker_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/workout_plan_screen.dart';
import 'services/app_state.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(const FitAiCoachApp());
}

class FitAiCoachApp extends StatefulWidget {
  const FitAiCoachApp({super.key});

  @override
  State<FitAiCoachApp> createState() => _FitAiCoachAppState();
}

class _FitAiCoachAppState extends State<FitAiCoachApp> {
  final AppState appState = AppState();

  @override
  void dispose() {
    appState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      appState: appState,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FitAI Coach',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: AppColors.background,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          ),
          useMaterial3: true,
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (_) => const SplashScreen(),
          LoginScreen.routeName: (_) => const LoginScreen(),
          DashboardScreen.routeName: (_) => const DashboardScreen(),
          GoalSetupScreen.routeName: (_) => const GoalSetupScreen(),
          WorkoutPlanScreen.routeName: (_) => const WorkoutPlanScreen(),
          MealPlanScreen.routeName: (_) => const MealPlanScreen(),
          ProgressTrackerScreen.routeName: (_) => const ProgressTrackerScreen(),
          AiChatScreen.routeName: (_) => const AiChatScreen(),
          PostureCheckScreen.routeName: (_) => const PostureCheckScreen(),
          PostureResultScreen.routeName: (_) => const PostureResultScreen(),
          ProfileScreen.routeName: (_) => const ProfileScreen(),
        },
      ),
    );
  }
}

class AppStateScope extends InheritedNotifier<AppState> {
  const AppStateScope({super.key, required AppState appState, required super.child}) : super(notifier: appState);

  static AppState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppStateScope>();
    assert(scope != null, 'AppStateScope not found');
    return scope!.notifier!;
  }

  static AppState read(BuildContext context) {
    final element = context.getElementForInheritedWidgetOfExactType<AppStateScope>();
    final scope = element?.widget as AppStateScope?;
    assert(scope != null, 'AppStateScope not found');
    return scope!.notifier!;
  }
}
