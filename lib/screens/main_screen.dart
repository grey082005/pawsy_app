import 'package:flutter/material.dart';
import '../models/cat_profile.dart';
import 'match_screen.dart';
import 'liked_screen.dart';
import 'profile_screen.dart';
import '../components/bottom_nav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<CatProfile> _likedCats = [];

  void _likeCat(CatProfile cat) {
    if (!_likedCats.contains(cat)) {
      setState(() {
        _likedCats.add(cat);
      });
      print("Liked ${cat.name}, total liked: ${_likedCats.length}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      MatchScreen(onLike: _likeCat),
      LikedScreen(likedCats: _likedCats),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
