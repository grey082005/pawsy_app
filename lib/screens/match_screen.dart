import 'package:flutter/material.dart';
import 'package:pawsy_app/models/cat_profile.dart';
import 'package:pawsy_app/components/cat_card.dart';

class MatchScreen extends StatefulWidget {
  final Function(CatProfile) onLike;
  final Function() onDislike;

  const MatchScreen({
    super.key,
    required this.onLike,
    required this.onDislike,
  });

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  final List<CatProfile> _cats = [
    CatProfile(
      name: 'Whiskers',
      age: 2,
      breed: 'Siamese',
      image: 'assets/images/cat1.jpg',
      bio: 'Loves sunbathing and long naps.',
    ),
    CatProfile(
      name: 'Shadow',
      age: 3,
      breed: 'Maine Coon',
      image: 'assets/images/cat2.jpg',
      bio: 'Curious and playful explorer.',
    ),
    CatProfile(
      name: 'Mittens',
      age: 1,
      breed: 'Persian',
      image: 'assets/images/cat3.jpg',
      bio: 'Quiet but loves to cuddle.',
    ),
    CatProfile(
      name: 'Simba',
      age: 4,
      breed: 'Abyssinian',
      image: 'assets/images/cat4.jpg',
      bio: 'Energetic and loves to pounce on anything that moves.',
    ),
    CatProfile(
      name: 'Nala',
      age: 3,
      breed: 'Ragdoll',
      image: 'assets/images/cat5.jpg',
      bio: 'Queen of the house and snuggly at night.',
    ),
    CatProfile(
      name: 'Toby',
      age: 5,
      breed: 'British Shorthair',
      image: 'assets/images/cat6.jpg',
      bio: 'Snoozy potato. Will sleep on your keyboard.',
    ),
  ];

  int _currentIndex = 0;

  void _likeCat() {
    if (_currentIndex < _cats.length) {
      widget.onLike(_cats[_currentIndex]);
      _nextCat();
    }
  }

  void _dislikeCat() {
    if (_currentIndex < _cats.length) {
      widget.onDislike();
      _nextCat();
    }
  }

  void _nextCat() {
    setState(() {
      _currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex >= _cats.length) {
      return const Center(child: Text("No more cats to match!"));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CatCard(
          cat: _cats[_currentIndex],
          onLike: _likeCat,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _dislikeCat,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 40),
            ElevatedButton(
              onPressed: _likeCat,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
              ),
              child: const Icon(Icons.favorite, color: Colors.white, size: 30),
            ),
          ],
        ),
      ],
    );
  }
}
