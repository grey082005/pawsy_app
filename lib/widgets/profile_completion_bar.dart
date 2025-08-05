import 'package:flutter/material.dart';

class ProfileCompletionBar extends StatelessWidget {
  final double completion;

  const ProfileCompletionBar({super.key, required this.completion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Profile Completion'),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: completion,
          color: Colors.pinkAccent,
          backgroundColor: Colors.grey[300],
        ),
      ],
    );
  }
}
