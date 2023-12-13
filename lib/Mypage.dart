import 'package:flutter/material.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:mine_app/Registration.dart';


class Mypage extends StatelessWidget {


  final String child;
  final VoidCallback onTap;


  Mypage({required this.child, required this.onTap});

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
              if (child == 'Apply for Consession') {
                // Handle navigation to Registration
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Registration(),));
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