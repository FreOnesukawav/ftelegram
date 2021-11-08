# FTelegram - Telegram on Flutter!

A Telegram android version, written on Flutter & Dart.  
With using TDlib and MTProto

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Run FTelegram on your android device
> [!NOTE]
> For start confirm flutter instalation on your machine.
``` Bash
$ git clone https://github.com/denver-code/ftelegram
$ cd ftelegram
$ flutter analyze
$ flutter test
$ flutter pub get
$ flutter run lib/main.dart
```
## 
Build an APK
> [!NOTE]
> For start confirm flutter instalation on your machine.
``` Bash
$ git clone https://github.com/denver-code/ftelegram
$ cd ftelegram
$ flutter analyze
$ flutter test
$ flutter pub get
$ flutter build apk --split-per-abi
```
This commands results in three APK files:
```
    [project]/build/app/outputs/apk/release/app-armeabi-v7a-release.apk
    [project]/build/app/outputs/apk/release/app-arm64-v8a-release.apk
    [project]/build/app/outputs/apk/release/app-x86_64-release.apk
```