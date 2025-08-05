import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  final List<Map<String, String>> events = const [
    {
      'title': 'Pawsy Playdate',
      'host': 'Whiskers',
      'location': 'Berlin Pet Park',
      'date': 'Aug 10',
      'time': '3:00 PM',
      'description':
          'Join Whiskers and friends for a sunny day of tail-chasing!'
    },
    {
      'title': 'Groom & Mingle',
      'host': 'Fluffy',
      'location': 'Pawfect Salon',
      'date': 'Aug 12',
      'time': '11:00 AM',
      'description': 'Pamper your paws and meet fancy felines!'
    },
    {
      'title': 'Midnight Zoomies',
      'host': 'Shadow',
      'location': 'Moonlight Alley',
      'date': 'Aug 15',
      'time': '9:00 PM',
      'description': 'Race under the stars with Shadow and crew.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Events'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event['title'] ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Host: ${event['host']}'),
                  Text('Location: ${event['location']}'),
                  Text('Date: ${event['date']} at ${event['time']}'),
                  const SizedBox(height: 8),
                  Text(
                    event['description'] ?? '',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
