import 'package:flutter/material.dart';

import '../services/ai_service.dart';
import '../utils/app_colors.dart';
import '../widgets/bottom_nav.dart';
import 'dashboard_screen.dart';
import 'goal_setup_screen.dart';
import 'profile_screen.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  static const routeName = '/ai-chat';

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final AiService aiService = AiService();
  final TextEditingController controller = TextEditingController();
  final List<_Message> messages = [const _Message(text: 'Hi Farooq, I’m your AI fitness coach. How can I help you today?', isUser: false)];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    setState(() {
      messages.add(_Message(text: text.trim(), isUser: true));
      controller.clear();
    });
    final response = await aiService.sendChatMessage(text);
    setState(() => messages.add(_Message(text: response, isUser: false)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('AI Coach'), backgroundColor: AppColors.background, elevation: 0),
      bottomNavigationBar: FitBottomNav(
        currentIndex: 2,
        onTap: (index) {
          final routes = [DashboardScreen.routeName, GoalSetupScreen.routeName, AiChatScreen.routeName, ProfileScreen.routeName];
          if (index != 2) Navigator.pushNamed(context, routes[index]);
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                children: ['What should I eat today?', 'Best workout for beginners', 'Can I train with knee pain?'].map((question) => Padding(padding: const EdgeInsets.only(right: 8), child: ActionChip(label: Text(question), onPressed: () => sendMessage(question)))).toList(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: messages.length,
                itemBuilder: (context, index) => _Bubble(message: messages[index]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(child: TextField(controller: controller, decoration: const InputDecoration(hintText: 'Type your message...'))),
                  const SizedBox(width: 8),
                  CircleAvatar(backgroundColor: AppColors.primary, child: IconButton(color: Colors.white, icon: const Icon(Icons.send), onPressed: () => sendMessage(controller.text))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Message {
  const _Message({required this.text, required this.isUser});
  final String text;
  final bool isUser;
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.message});
  final _Message message;
  @override
  Widget build(BuildContext context) => Align(
    alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .76),
      decoration: BoxDecoration(color: message.isUser ? AppColors.primary : Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Text(message.text, style: TextStyle(color: message.isUser ? Colors.white : AppColors.textDark)),
    ),
  );
}
