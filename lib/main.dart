import 'package:flutter/material.dart';
import 'package:register_app/MainScreen.dart';
import 'package:register_app/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Set the app's primary theme color
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => MainScreenWithIndex(0), // Adjust your home route
        '/employeeRegister': (context) => MainScreenWithIndex(1),
        '/pieceworkAgreement': (context) => MainScreenWithIndex(2),
        '/pieceworkRates': (context) => MainScreenWithIndex(3),
        '/rulesRegu': (context) => MainScreenWithIndex(4),
        '/inductionCheck': (context) => MainScreenWithIndex(5),
        '/staffHygiene': (context) => MainScreenWithIndex(6),
        '/workplaceHealth': (context) => MainScreenWithIndex(7),
        '/emergencyPlan': (context) => MainScreenWithIndex(8),
      },
    );
  }
}

class MainScreenWithIndex extends StatelessWidget {
  final int index;
  const MainScreenWithIndex(this.index, {super.key});

  @override
  Widget build(BuildContext context) => MainScreen(initialIndex: index);
}
