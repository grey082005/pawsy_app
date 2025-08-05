import 'package:flutter/material.dart';
import 'package:pawsy_app/components/bottom_nav.dart';
import 'package:pawsy_app/screens/match_screen.dart';
import 'package:pawsy_app/screens/liked_screen.dart';
import 'package:pawsy_app/screens/profile_screen.dart';
import 'package:pawsy_app/screens/event_screen.dart';
import 'package:pawsy_app/models/cat_profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<CatProfile> _likedCats = [];

  void _onLike(CatProfile cat) {
    setState(() {
      _likedCats.add(cat);
    });
  }

  void _onDislike() {
    // Optional: You can add logic here
  }

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      MatchScreen(
        onLike: _onLike,
        onDislike: _onDislike,
      ),
      LikedScreen(likedCats: _likedCats),
      const ProfileScreen(),
      const EventScreen(),
    ];
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNav(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
