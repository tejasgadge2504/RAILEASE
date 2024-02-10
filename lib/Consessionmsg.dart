import 'package:flutter/material.dart';

class Consessionmsg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'You have successfully applied for concession. Your application is under processing. Your slot to collect consession will be notified via your Alternate E-Mail once your concession pass is ready. Kindly keep checking your Alternate E-Mail account on a regular basis',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Generally, it takes around 2-3 working days of college to process an application. If you have not heard back via E-Mail even after 2-3 working days, then you are requested to contact your college administrator in person (room 208B) in order to avoid further delays.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Dismiss the bottom sheet
              Navigator.pop(context); // Navigate back to the homepage
            },
            child: Text('Back'),
          ),
        ],
      ),
    );
  }
}
