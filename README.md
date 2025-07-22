# register_app

This project is copyrighted for BIRVA AUS PTV LTD.

## Getting Started

This project is a dedicated and premoided with the requirements of BIRVA AUS PTV LTD.

Project contains the registeration form created on flutter, storing in local device in excel and print the form at the real-time . Storing format is excel and pdf. 

Requirements:
- Install Flutter v3.32.6 - channel stable - https://github.com/flutter/flutter.git
- Install dart v3.8.1 - DevTools v2.45.1
- Install java v24.0.1, JRE v24.0.1+9-30
- Install VSC, extensions in VSC-CMake tools, Flutter, Gradle for Java
- Install Android Studio Narwhal v2025.1.1 Patch 1

Note: After installation of the mentioned packages, make sure to add them in the environmental path in your system.

Resources:
- Android Device & ios Device for debugging in Gradle
- Microsoft edge for web debugging

How to run: 
- flutter pub get
- flutter clean
- flutter build apk - FOR ANDROID
- flutter build web - FOR WEB
- flutter run (recommended) / flutter run -t lib/main.dart (for particular file)

To check devices for gradle:
- flutter devices
- flutter run -d emulator-5554 (for specific device)

To check issues:
- flutter doctor

For hot reload:
- Ctrl + R

Project Overview : 

register_app
|
|
-lib
|
--main.dart 
--emergency_plan.dart
--employee_register.dart
--home_screen.dart
--induction_check.dart
--MainScreen.dart
--piecework_agreement.dart
--piecework_rates.dart
--rules_regu.dart
--splashscreen.dart
--staff_hygiene.dart
--workplace_health.dart

Add new files under .dart extension if it is a flutter file. 
