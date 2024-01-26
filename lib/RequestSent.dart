import 'package:flutter/material.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:mine_app/ApplyDetails.dart';

class RequestSent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.tealAccent,
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Request Sent Successfully',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Please collect the HardCopy of the Concession Form From the Railway Concession Counter',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Thank you For using. See you Again',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('For any Queries Contact',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Feedback'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
