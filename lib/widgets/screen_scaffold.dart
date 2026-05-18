import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ScreenScaffold extends StatelessWidget {
  const ScreenScaffold({super.key, required this.title, required this.children, this.actions});

  final String title;
  final List<Widget> children;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(title),
        actions: actions,
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textDark,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: children,
        ),
      ),
    );
  }
}
