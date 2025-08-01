import 'package:flutter/material.dart';
import '../models/cat_profile.dart';
import 'cat_detail_screen.dart';

class MatchScreen extends StatelessWidget {
  final void Function(CatProfile cat) onLike;

  const MatchScreen({super.key, required this.onLike});

  @override
  Widget build(BuildContext context) {
    final List<CatProfile> catProfiles = [
      CatProfile(
        name: "Whiskers",
        age: 3,
        bio: "Loves napping in sunbeams and chasing lasers.",
        imagePath: "assets/images/cat1.jpg",
      ),
      CatProfile(
        name: "Mittens",
        age: 2,
        bio: "Big foodie and purring machine.",
        imagePath: "assets/images/cat2.jpg",
      ),
      CatProfile(
        name: "Shadow",
        age: 4,
        bio: "Shy but sweet. Loves dark corners.",
        imagePath: "assets/images/cat3.jpg",
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Find Your Purrfect Match 💘")),
      body: PageView.builder(
        itemCount: catProfiles.length,
        itemBuilder: (context, index) {
          final cat = catProfiles[index];
          return GestureDetector(
            onDoubleTap: () {
              onLike(cat);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You liked ${cat.name}!')),
              );
            },
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CatDetailScreen(cat: cat)),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: AssetImage(cat.imagePath),
                  fit: BoxFit.cover,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  ),
                ),
                child: Text(
                  '${cat.name}, ${cat.age}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
