import 'package:flutter/material.dart';

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
                _showConfirmationSnackBar(context);
              },
              child: Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationSnackBar(BuildContext context) {
    final SnackBar snackBar = SnackBar(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Ensure the column only takes the minimum required space
        children: [
          Text(
            'You have successfully applied for concession. Your application is under processing. You will be notified via your Alternate E-Mail once your concession pass is ready. Kindly keep checking your Alternate E-Mail account on a regular basis',
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Back',
                style: TextStyle(color:Colors.white),
              ),
            ),
          ),
        ],
      ),
      duration: Duration(seconds: 6),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
