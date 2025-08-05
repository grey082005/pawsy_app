import 'package:flutter/material.dart';
import 'package:pawsy_app/models/cat_profile.dart';
import 'package:lottie/lottie.dart';

class CatCard extends StatelessWidget {
  final CatProfile cat;
  final VoidCallback onLike;

  const CatCard({
    super.key,
    required this.cat,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(cat.image),
            ),
            const SizedBox(height: 10),
            Text(
              cat.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(cat.breed),
            Text('${cat.age} years old'),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                cat.bio,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            Lottie.asset('assets/lottie/heart.json', width: 80),
            ElevatedButton.icon(
              onPressed: onLike,
              icon: const Icon(Icons.favorite),
              label: const Text('Like'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
