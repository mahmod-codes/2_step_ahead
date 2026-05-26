# 2step aheaad

2step aheaad is an internal engineering specification generator. It lets a user sign in, create a project idea, answer a short questionnaire, generate a structured Gemini-backed technical spec, edit the result, and keep version history.

## Tech Stack

- Flutter and Dart
- Riverpod for state management
- Firebase Auth for authentication
- Drift with SQLite for local persistence
- Gemini via `google_generative_ai`
- `flutter_secure_storage` for storing the Gemini API key and theme preference
- Freezed and JSON Serializable for immutable models

## Setup

1. Install Flutter from https://docs.flutter.dev/get-started/install.
2. Verify the toolchain:

   ```bash
   flutter doctor
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Generate Drift, Freezed, and JSON code:

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. Configure Firebase for each target platform using the FlutterFire CLI if `lib/firebase_options.dart` needs regeneration.

6. Run the app:

   ```bash
   flutter run
   ```

## Gemini API Key

The app prompts for a Gemini API key when generation is first used. The key is saved with `flutter_secure_storage` under `gemini_api_key`.

For local testing, use the in-app API key dialog. Do not commit real API keys.

## Android Debug Build

To build a debug APK:

```bash
flutter build apk --debug
```

## Folder Structure

- `lib/core`: shared constants, theme, and utilities.
- `lib/data/database`: Drift database, tables, and DAOs.
- `lib/data/services`: Firebase auth, Gemini integration, repository, and typed service errors.
- `lib/domain/entities`: immutable app entities.
- `lib/domain/usecases`: application use cases used by providers and UI.
- `lib/presentation/providers`: Riverpod providers and controllers for auth, projects, questionnaire, generation, and theme.
- `lib/presentation/screens`: auth, dashboard, project, questionnaire, generation, and spec viewer screens.
- `lib/presentation/widgets`: reusable UI widgets.
- `test`: DAO, service, provider, use case, and widget tests.

## Verification

Run these before pushing:

```bash
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter build apk --debug
```
