import 'package:flutter/material.dart';
//import 'habit_tracker.dart';
import 'finance_tracker.dart';
import 'mood_tracker.dart';
import 'water_tracker.dart';
import 'shopping_list.dart';

void main() => runApp(GirlyTrackerApp());

// Days of the week constant
const List<String> daysOfWeek = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];

class GirlyTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TrackerHome(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
    );
  }
}

class TrackerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Girly Tracker App'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          /*TrackerButton(
            'Habit Tracker',
            Icons.check_circle,
            Colors.pinkAccent,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HabitTrackerScreen()),
              );
            },
          ), */
          TrackerButton(
            'Finance Tracker',
            Icons.attach_money,
            Colors.orange,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FinanceTrackerScreen()),
              );
            },
          ),
          TrackerButton('Mood Tracker', Icons.mood, Colors.purpleAccent, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => MoodTrackerScreen()),
            );
          }),
          TrackerButton(
            'Water Intake',
            Icons.water_drop,
            Colors.blueAccent,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => WaterTrackerScreen()),
              );
            },
          ),
          TrackerButton('Shopping List', Icons.shopping_cart, Colors.teal, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ShoppingListScreen()),
            );
          }),
        ],
      ),
    );
  }
}

class TrackerButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  TrackerButton(this.label, this.icon, this.color, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: color,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Container(
            height: 60,
            width: double.infinity,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: Colors.white),
                  SizedBox(width: 15),
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
