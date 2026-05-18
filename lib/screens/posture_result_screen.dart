import 'package:flutter/material.dart';

import '../services/posture_service.dart';
import '../utils/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_card.dart';
import '../widgets/screen_scaffold.dart';

class PostureResultScreen extends StatelessWidget {
  const PostureResultScreen({super.key});

  static const routeName = '/posture-result';

  @override
  Widget build(BuildContext context) {
    final feedback = PostureService().postureFeedback();
    return ScreenScaffold(
      title: 'Posture Result',
      children: [
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(width: 150, height: 150, child: CircularProgressIndicator(value: .78, strokeWidth: 14, backgroundColor: AppColors.primaryLight, color: AppColors.primary)),
              const Text('78%', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900)),
            ],
          ),
        ),
        const SizedBox(height: 18),
        const Text('Good Job!', textAlign: TextAlign.center, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
        const SizedBox(height: 18),
        ...feedback.entries.map((entry) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: AppCard(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(entry.key, style: const TextStyle(fontWeight: FontWeight.w700)), Text(entry.value, style: TextStyle(fontWeight: FontWeight.w800, color: entry.value == 'Good' ? AppColors.primary : AppColors.warning))])),
        )),
        const SizedBox(height: 14),
        AppButton(text: 'Done', onPressed: () => Navigator.popUntil(context, (route) => route.isFirst)),
      ],
    );
  }
}
