import 'package:flutter/material.dart';
import 'main.dart'; // For daysOfWeek

class MoodTrackerScreen extends StatefulWidget {
  @override
  _MoodTrackerScreenState createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  final List<Map<String, dynamic>> moods = [
    {'name': 'Happy', 'color': Colors.blueAccent},
    {'name': 'Calm', 'color': Colors.greenAccent},
    {'name': 'Excited', 'color': Colors.pinkAccent},
    {'name': 'Energetic', 'color': Colors.purpleAccent},
    {'name': 'Tired', 'color': Colors.grey},
    {'name': 'Angry', 'color': Colors.redAccent},
  ];
  Map<String, String> selectedMood = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mood Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: daysOfWeek.map((day) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                title: Text(day),
                subtitle: Text(selectedMood[day] ?? 'Select your mood'),
                trailing: DropdownButton<String>(
                  value: selectedMood[day],
                  underline: Container(),
                  items: moods.map<DropdownMenuItem<String>>((m) {
                    return DropdownMenuItem<String>(
                      value: m['name'],
                      child: Row(
                        children: [
                          CircleAvatar(backgroundColor: m['color'], radius: 10),
                          SizedBox(width: 8),
                          Text(m['name']),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedMood[day] = val!;
                    });
                  },
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
