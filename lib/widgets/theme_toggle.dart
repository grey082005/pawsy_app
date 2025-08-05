import 'package:flutter/material.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Dark Mode'),
        Switch(
          value: brightness == Brightness.dark,
          onChanged: (value) {
            // You can implement a real theme toggle here if needed
          },
        ),
      ],
    );
  }
}
