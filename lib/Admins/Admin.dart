import 'package:flutter/material.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:mine_app/src/constants/colors.dart';

import 'MonthlyReportPage.dart';

class Admin extends StatelessWidget {
  final String child;
  final VoidCallback onTap;

  Admin({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: tbutton_widget_color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ElevatedButton(
          onPressed: () {
            // Use Navigator to navigate to the respective page
            if (child == 'Concession Request Management') {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ConcessionRequestPage()),
              // );
            } else if (child == 'User Management') {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => UserManagementPage()),
              // );
            } else if (child == 'Notification Management') {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => NotificationManagementPage()),
              // );
            } else if (child == 'Monthly Report') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MonthlyReportPage()),
              );
            } else {
              // Handle other actions if needed
            }
          },
          child: Text(
            child,
            style: TextStyle(fontSize: 32),
          ),
        ),
      ),
    );
  }
}
