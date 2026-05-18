import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_card.dart';
import '../widgets/screen_scaffold.dart';

class ProgressTrackerScreen extends StatelessWidget {
  const ProgressTrackerScreen({super.key});

  static const routeName = '/progress';

  @override
  Widget build(BuildContext context) {
    final profile = AppStateScope.of(context).profile;
    final workouts = AppStateScope.of(context).workoutsCompletedThisWeek;
    return ScreenScaffold(
      title: 'Progress Tracker',
      children: [
        Row(
          children: [
            Expanded(child: _MetricCard(title: 'Current weight', value: profile.weight.isEmpty ? '82 kg' : '${profile.weight} kg')),
            const SizedBox(width: 12),
            const Expanded(child: _MetricCard(title: 'Target weight', value: '75 kg')),
          ],
        ),
        const SizedBox(height: 14),
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Weekly progress chart', style: TextStyle(fontWeight: FontWeight.w800)),
            const SizedBox(height: 18),
            SizedBox(height: 120, child: Row(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceAround, children: const [_Bar(height: 45), _Bar(height: 68), _Bar(height: 58), _Bar(height: 90), _Bar(height: 82), _Bar(height: 110), _Bar(height: 96)])),
          ]),
        ),
        const SizedBox(height: 14),
        _InfoRow(label: 'Calories goal', value: '2,000 kcal/day'),
        _InfoRow(label: 'Workouts completed this week', value: '$workouts workouts'),
        const SizedBox(height: 18),
        AppButton(text: 'Add Progress', icon: Icons.add, onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Progress form placeholder')))),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) => AppCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(color: AppColors.textMuted)), const SizedBox(height: 8), Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800))]));
}

class _Bar extends StatelessWidget {
  const _Bar({required this.height});
  final double height;
  @override
  Widget build(BuildContext context) => Container(width: 22, height: height, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(10)));
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 10), child: AppCard(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label), Text(value, style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.primary))])));
}
