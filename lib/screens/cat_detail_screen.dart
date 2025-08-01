import 'package:flutter/material.dart';
import '../models/cat_profile.dart';

class CatDetailScreen extends StatelessWidget {
  final CatProfile cat;

  const CatDetailScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${cat.name}'s Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(cat.imagePath, height: 250),
            ),
            const SizedBox(height: 20),
            Text("${cat.name}, ${cat.age}",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(cat.bio, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
