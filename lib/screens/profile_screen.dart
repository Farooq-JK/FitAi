import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/app_card.dart';
import '../widgets/bottom_nav.dart';
import 'ai_chat_screen.dart';
import 'dashboard_screen.dart';
import 'goal_setup_screen.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Profile'), backgroundColor: AppColors.background, elevation: 0),
      bottomNavigationBar: FitBottomNav(
        currentIndex: 3,
        onTap: (index) {
          final routes = [DashboardScreen.routeName, GoalSetupScreen.routeName, AiChatScreen.routeName, ProfileScreen.routeName];
          if (index != 3) Navigator.pushNamed(context, routes[index]);
        },
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const CircleAvatar(radius: 52, backgroundColor: AppColors.primaryLight, child: Icon(Icons.person, size: 58, color: AppColors.primary)),
            const SizedBox(height: 14),
            const Text('Farooq Ahmed', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            const Text('farooq@example.com', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 24),
            _MenuItem(icon: Icons.badge_outlined, title: 'Personal Information'),
            _MenuItem(icon: Icons.flag_outlined, title: 'My Goals'),
            _MenuItem(icon: Icons.event_note_outlined, title: 'My Plans'),
            _MenuItem(icon: Icons.settings_outlined, title: 'Settings'),
            _MenuItem(icon: Icons.logout, title: 'Logout', onTap: () => Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false)),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({required this.icon, required this.title, this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AppCard(
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(backgroundColor: AppColors.primaryLight, child: Icon(icon, color: AppColors.primary)),
            const SizedBox(width: 14),
            Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700))),
            const Icon(Icons.chevron_right, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}
