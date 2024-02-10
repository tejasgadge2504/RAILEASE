import 'package:flutter/material.dart';
import 'package:mine_app/Consessionmsg.dart';

class RenewalPage extends StatefulWidget {
  @override
  _RenewalPageState createState() => _RenewalPageState();
}

class _RenewalPageState extends State<RenewalPage> {
  String? _selectedPassType;
  String? _selectedClassType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Concession Request'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Pass Type:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Column(
              children: <Widget>[
                RadioListTile<String>(
                  title: const Text('Monthly'),
                  value: 'Monthly',
                  groupValue: _selectedPassType,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedPassType = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Quarterly'),
                  value: 'Quarterly',
                  groupValue: _selectedPassType,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedPassType = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Select Train Class Type:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Column(
              children: <Widget>[
                RadioListTile<String>(
                  title: const Text('First class'),
                  value: 'First class',
                  groupValue: _selectedClassType,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedClassType = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Second class'),
                  value: 'Second class',
                  groupValue: _selectedClassType,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedClassType = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return FractionallySizedBox(
                      heightFactor: 0.5,
                      child: Consessionmsg(),
                    );
                  },
                );
              },
              child: Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
}
