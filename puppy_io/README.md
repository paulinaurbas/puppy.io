# puppy_io

App helping with dog adoption.

## Technology stack in mobile app
- flutter_bloc
- GetIt
- Ease localization
- Json serialization
- Dio
- Json annotation

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

First run:
1. Install flutter
2. run `flutter pub get`
3. run `flutter run`

### Adding new translation
To add new translation please add keys to en.json and pl.json files, then run command
`flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart` to generate translations

### Generating code
To generate code required to data serialization, run
`flutter pub run build_runner build --delete-conflicting-outputs`

