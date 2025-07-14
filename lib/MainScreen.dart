import 'package:flutter/material.dart';
import 'package:register_app/emergency_plan.dart';
import 'package:register_app/employee_register.dart';
import 'package:register_app/home_screen.dart';
import 'package:register_app/induction_check.dart';
import 'package:register_app/piecework_agreement.dart';
import 'package:register_app/piecework_rates.dart';
import 'package:register_app/rules_regu.dart';
import 'package:register_app/staff_hygiene.dart';
import 'package:register_app/workplace_health.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required int initialIndex});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final _routes = [
    '/home',
    '/employeeRegister',
    '/pieceworkAgreement',
    '/pieceworkRates',
    '/rulesRegu',
    '/inductionCheck',
    '/staffHygiene',
    '/workplaceHealth',
    '/emergencyPlan',
    '/search',
  ];

  void _onTap(int index) {
    if (_currentIndex == index) return;
    Navigator.pushReplacementNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: GlobalKey<NavigatorState>(), // Optional if you're nesting
        onGenerateRoute: (_) => MaterialPageRoute(
          builder: (_) {
            switch (_currentIndex) {
              case 1:
                return EmployeeRegister();
              case 2:
                return PieceworkAgreement();
              case 3:
                return PieceworkRates(); // Assuming you have a PieceworkRates widget
              case 4:
                return RulesRegu();
              case 5:
                return InductionCheck();
              case 6:
                return StaffHygiene();
              case 7:
                return WorkplaceHealth();
              case 8:
                return EmergencyPlan();
              default:
                return HomeScreen();
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white60,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _onTap(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration_rounded),
            label: 'Registeration Form',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_download),
            label: 'Piecework Agreement',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Piecework Rates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rule),
            label: 'Rules & Regulations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Induction Check',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.clean_hands),
            label: 'Staff Hygiene',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'Workplace Health',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'Emergency Plan',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}
