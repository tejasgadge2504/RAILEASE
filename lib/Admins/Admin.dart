import 'package:flutter/material.dart';
import 'package:mine_app/Admins/RegisteredUsers.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:mine_app/Admins/Concession_manage.dart';

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
        child:
        ElevatedButton(
          onPressed: () {
            if (child == 'Concession Request Management') {
              // Handle navigation to Registration
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => Concessionmanagement(),));
            }
            if (child == 'Reg Management') {
              // Handle navigation to Registration
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegUsers(),));
            }
            if (child == 'Notification Management ') {
              // Handle navigation to Registration
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyStepsPage(),));
            }
            if (child == 'Monthly Report') {
              // Handle navigation to Registration
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ApplicationStatus(),));
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

