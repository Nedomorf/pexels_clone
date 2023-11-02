import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../utlis/constants.dart';
import '../utlis/routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _tabChange(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  late int _tabIndex;

  @override
  void initState() {
    _tabIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        gap: 12,
        tabBackgroundColor: accentColor,
        activeColor: textColor,
        tabBorderRadius: 20,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        tabMargin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        selectedIndex: _tabIndex,
        onTabChange: _tabChange,
        tabs: const [
          GButton(
            icon: Icons.search,
            text: 'Search',
          ),
          GButton(icon: Icons.favorite_border_outlined, text: 'Favourites'),
          GButton(icon: Icons.account_circle_outlined, text: 'Profile')
        ],
      ),
      body: routes[_tabIndex],
    );
  }
}
