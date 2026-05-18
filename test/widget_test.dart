import 'package:fitai_coach/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('FitAI Coach splash screen loads', (tester) async {
    await tester.pumpWidget(const FitAiCoachApp());
    expect(find.text('FitAI Coach'), findsOneWidget);
    expect(find.text('Your AI Fitness Assistant'), findsOneWidget);
  });
}
