# fluttertodo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Rebuild json_serialize metadata ( Automatic serialization )
Should be rebuilt when you add new parameters to any Model

```
flutter packages pub run build_runner build
```

## How to build a new version

Increment build version in pubspec.yaml and run 

```
flutter build appbundle --target-platform android-arm,android-arm64,android-x64
```

