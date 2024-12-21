import 'package:flutter/material.dart';
import 'package:musixmatch/constants.dart';
import 'package:musixmatch/pages/home.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const navItems = [
      (label: 'Home', icon: Icons.home),
      (label: 'Music', icon: Icons.music_note),
      (label: 'Contribute', icon: Icons.add_circle_outline),
      (label: 'Identify', icon: Icons.radio_button_checked),
      (label: 'Search', icon: Icons.search),
    ];
    return Scaffold(
      backgroundColor: AppColors.background,
      body: switch (currentIndex) {
        1 => Center(child: Text('Music', style: TextStyle(color: Colors.white))),
        2 => Center(child: Text('Contribute', style: TextStyle(color: Colors.white))),
        3 => Center(child: Text('Identify', style: TextStyle(color: Colors.white))),
        4 => Center(child: Text('Search', style: TextStyle(color: Colors.white))),
        _ => HomeTab(),
      },
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.bottomNavBG,
        selectedItemColor: Colors.white,
        unselectedItemColor: AppColors.icon,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          for (final navItem in navItems) ...[
            BottomNavigationBarItem(
              label: navItem.label,
              icon: Icon(navItem.icon),
            ),
          ],
        ],
      ),
    );
  }
}