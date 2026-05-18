# FitAI Coach

FitAI Coach is a beginner-friendly Flutter Android fitness app prototype for a final year software development project. It uses clean local dummy data, placeholder AI responses, and a placeholder posture-checking flow.

## Features

- Splash and simple login/sign-up navigation
- Dashboard summary with green fitness UI
- Goal setup form stored in app state
- Dummy AI workout and meal plans
- Progress tracker with chart placeholder
- AI chat with placeholder coach responses
- Posture check and posture result mock screens
- Profile screen

## Run

```bash
flutter pub get
flutter run
```

## Future integrations

- Add Gemini API calls in `lib/services/ai_service.dart`.
- Add MediaPipe Pose camera analysis in `lib/services/posture_service.dart`.
- Replace in-memory app state with SharedPreferences or SQLite for persistent local storage.
