import 'package:flutter/material.dart';
import 'package:pawsy_app/models/cat_profile.dart';
import 'package:pawsy_app/screens/chat_screen.dart';

class LikedScreen extends StatelessWidget {
  final List<CatProfile> likedCats;

  const LikedScreen({super.key, required this.likedCats});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: likedCats.length,
      itemBuilder: (context, index) {
        final cat = likedCats[index];
        return ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(cat.image)),
          title: Text(cat.name),
          subtitle: Text(cat.breed),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(catName: cat.name),
              ),
            );
          },
        );
      },
    );
  }
}
