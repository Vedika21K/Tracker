import 'package:flutter/material.dart';

class ShoppingListScreen extends StatefulWidget {
  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final _itemController = TextEditingController();
  List<Map<String, dynamic>> items = [];

  void addItem(String name) {
    setState(() {
      items.add({'name': name, 'checked': false});
    });
    _itemController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _itemController,
              decoration: InputDecoration(
                labelText: 'Add item',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text('Add'),
              onPressed: () {
                if (_itemController.text.isNotEmpty)
                  addItem(_itemController.text.trim());
              },
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: items.map((item) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: CheckboxListTile(
                      value: item['checked'],
                      title: Text(item['name']),
                      onChanged: (val) {
                        setState(() {
                          item['checked'] = val!;
                        });
                      },
                      activeColor: Colors.tealAccent,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
