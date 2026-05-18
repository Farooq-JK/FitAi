import 'package:flutter/material.dart';

import '../models/fitness_profile.dart';

class AppState extends ChangeNotifier {
  FitnessProfile profile = FitnessProfile();
  int workoutsCompletedThisWeek = 2;

  void saveProfile(FitnessProfile updatedProfile) {
    // Local app-state storage for the prototype. SharedPreferences or SQLite can be added later.
    profile = updatedProfile;
    notifyListeners();
  }

  void markWorkoutCompleted() {
    workoutsCompletedThisWeek += 1;
    notifyListeners();
  }
}
