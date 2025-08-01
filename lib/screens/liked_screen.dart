import 'package:flutter/material.dart';
import '../models/cat_profile.dart';
import 'cat_detail_screen.dart';

class LikedScreen extends StatelessWidget {
  final List<CatProfile> likedCats;

  const LikedScreen({super.key, required this.likedCats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liked Cats")),
      body: likedCats.isEmpty
          ? const Center(child: Text("No matches yet!"))
          : ListView.builder(
              itemCount: likedCats.length,
              itemBuilder: (context, index) {
                final cat = likedCats[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(cat.imagePath),
                  ),
                  title: Text(cat.name),
                  subtitle: Text(cat.bio),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CatDetailScreen(cat: cat),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
