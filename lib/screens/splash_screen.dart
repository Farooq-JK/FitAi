import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/app_button.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 118,
                height: 118,
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: const Icon(Icons.fitness_center, color: AppColors.primary, size: 56),
              ),
              const SizedBox(height: 28),
              const Text('FitAI Coach', style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w800)),
              const SizedBox(height: 10),
              const Text('Your AI Fitness Assistant', style: TextStyle(color: Colors.white70, fontSize: 18)),
              const SizedBox(height: 54),
              AppButton(
                text: 'Get Started',
                onPressed: () => Navigator.pushReplacementNamed(context, LoginScreen.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
