import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/app_button.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 36),
            const Icon(Icons.eco, color: AppColors.primary, size: 58),
            const SizedBox(height: 18),
            const Text('Welcome Back', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            const Text('Login or create an account to continue.', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 34),
            const TextField(keyboardType: TextInputType.emailAddress, decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined))),
            const SizedBox(height: 16),
            const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock_outline))),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: () {}, child: const Text('Forgot password?')),
            ),
            AppButton(text: 'Login', onPressed: () => Navigator.pushReplacementNamed(context, DashboardScreen.routeName)),
            const SizedBox(height: 12),
            AppButton(text: 'Create Account', isOutlined: true, onPressed: () => Navigator.pushReplacementNamed(context, DashboardScreen.routeName)),
          ],
        ),
      ),
    );
  }
}
