import 'package:flutter/material.dart';
import 'main.dart'; // For daysOfWeek

class WaterTrackerScreen extends StatefulWidget {
  @override
  _WaterTrackerScreenState createState() => _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends State<WaterTrackerScreen> {
  Map<String, double> waterIntake = {};

  Color getColor(double value) {
    if (value <= 3) return Colors.lightBlueAccent;
    if (value <= 7) return Colors.blue;
    return Colors.indigo[900]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Water Intake Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: daysOfWeek.map((day) {
            final val = waterIntake[day] ?? 0;
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: CircleAvatar(backgroundColor: getColor(val)),
                title: Text(day),
                subtitle: Text('Drank: ${val.toStringAsFixed(1)} Litre'),
                trailing: SizedBox(
                  width: 80,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Litres',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (valStr) {
                      double value = double.tryParse(valStr) ?? 0;
                      setState(() {
                        waterIntake[day] = value;
                      });
                    },
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
