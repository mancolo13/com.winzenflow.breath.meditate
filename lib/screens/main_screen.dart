import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'tabs/tab1_screen.dart';
import 'tabs/tab2_screen.dart';
import 'tabs/tab3_screen.dart';
import 'tabs/tab4_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Tab1Screen(),
    Tab2Screen(),
    Tab3Screen(),
    Tab4Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        backgroundColor: AppTheme.surfaceColor,
        indicatorColor: AppTheme.primaryColor.withValues(alpha: 0.2),
        destinations: [
        NavigationDestination(
          icon: const Icon(Icons.air_outlined),
          selectedIcon: const Icon(Icons.air, color: AppTheme.primaryColor),
          label: 'Breathe',
        ),
        NavigationDestination(
          icon: const Icon(Icons.spa_outlined),
          selectedIcon: const Icon(Icons.spa, color: AppTheme.primaryColor),
          label: 'Relax',
        ),
        NavigationDestination(
          icon: const Icon(Icons.hourglass_empty_outlined),
          selectedIcon: const Icon(Icons.hourglass_full, color: AppTheme.primaryColor),
          label: 'Timer',
        ),
        NavigationDestination(
          icon: const Icon(Icons.history_edu_outlined),
          selectedIcon: const Icon(Icons.history_edu, color: AppTheme.primaryColor),
          label: 'Log',
        ),

        ],
      ),
    );
  }
}
