class PostureService {
  Future<int> checkPostureScore() async {
    // TODO: Add camera frames and MediaPipe Pose landmarks here later.
    return 78;
  }

  Map<String, String> postureFeedback() {
    // TODO: Replace this dummy feedback with real computer vision analysis later.
    return const {
      'Back Position': 'Good',
      'Knee Position': 'Needs Improvement',
      'Balance': 'Good',
      'Depth': 'Good',
    };
  }
}
