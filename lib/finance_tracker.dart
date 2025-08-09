import 'package:flutter/material.dart';
import 'main.dart'; // For daysOfWeek

class FinanceTrackerScreen extends StatefulWidget {
  @override
  _FinanceTrackerScreenState createState() => _FinanceTrackerScreenState();
}

class _FinanceTrackerScreenState extends State<FinanceTrackerScreen> {
  Map<String, double> spent = {};

  Color getColor(double value) {
    if (value == 0) return Colors.white;
    if (value <= 500) return Colors.yellowAccent;
    if (value <= 1000) return Colors.orangeAccent;
    return Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Finance Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: daysOfWeek.map((day) {
            final val = spent[day] ?? 0;
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: CircleAvatar(backgroundColor: getColor(val)),
                title: Text(day),
                subtitle: Text('Spent: ₹${val.toStringAsFixed(2)}'),
                trailing: SizedBox(
                  width: 100,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (valStr) {
                      double value = double.tryParse(valStr) ?? 0;
                      setState(() {
                        spent[day] = value;
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
