import '../models/meal_item.dart';
import '../models/workout_item.dart';

class AiService {
  Future<List<WorkoutItem>> generateWorkoutPlan() async {
    // TODO: Connect Gemini API here later to generate a personalized workout.
    return const [
      WorkoutItem(title: 'Warm-up', subtitle: '5 minutes of arm circles and light jogging', icon: '🔥'),
      WorkoutItem(title: 'Squats', subtitle: '3 sets of 12 reps with slow controlled movement', icon: '🏋️'),
      WorkoutItem(title: 'Push-ups', subtitle: '3 sets of 8 reps; use knee push-ups if needed', icon: '💪'),
      WorkoutItem(title: 'Plank', subtitle: '3 rounds of 30 seconds, rest 30 seconds', icon: '⏱️'),
      WorkoutItem(title: 'Walking', subtitle: '20 minutes at a comfortable pace', icon: '🚶'),
    ];
  }

  Future<List<MealItem>> generateMealPlan() async {
    // TODO: Connect Gemini API here later to generate meals based on diet preference.
    return const [
      MealItem(name: 'Breakfast', description: 'Oats with banana, milk, and chia seeds', calories: 420),
      MealItem(name: 'Lunch', description: 'Grilled chicken rice bowl with mixed vegetables', calories: 620),
      MealItem(name: 'Dinner', description: 'Lentil soup, salad, and whole wheat bread', calories: 510),
      MealItem(name: 'Snack', description: 'Greek yogurt with apple slices', calories: 210),
    ];
  }

  Future<String> sendChatMessage(String message) async {
    // TODO: Send this prompt to Gemini API later and return the model response.
    if (message.toLowerCase().contains('knee')) {
      return 'If you have knee pain, keep workouts low impact and speak to a medical professional if pain continues.';
    }
    if (message.toLowerCase().contains('eat')) {
      return 'Today, try a balanced plate: lean protein, vegetables, whole grains, fruit, and plenty of water.';
    }
    return 'Great question! For now I am using placeholder AI advice. Start simple, stay consistent, and track your progress.';
  }
}
