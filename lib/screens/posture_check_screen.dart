import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_card.dart';
import '../widgets/screen_scaffold.dart';
import 'posture_result_screen.dart';

class PostureCheckScreen extends StatelessWidget {
  const PostureCheckScreen({super.key});

  static const routeName = '/posture-check';

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'Posture Check',
      children: [
        AppCard(
          padding: EdgeInsets.zero,
          child: Container(
            height: 360,
            decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(22)),
            child: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.videocam_outlined, color: Colors.white, size: 64), SizedBox(height: 12), Text('Camera preview placeholder', style: TextStyle(color: Colors.white70))])),
          ),
        ),
        const SizedBox(height: 20),
        const Text('Start your exercise and let AI check your posture.', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: AppColors.textDark, fontWeight: FontWeight.w700)),
        const SizedBox(height: 20),
        AppButton(text: 'Start Posture Check', icon: Icons.play_arrow, onPressed: () => Navigator.pushNamed(context, PostureResultScreen.routeName)),
      ],
    );
  }
}
