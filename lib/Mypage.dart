import 'package:flutter/material.dart';
import 'package:mine_app/src/constants/colors.dart';


class Mypage extends StatelessWidget {


  final String child;

  Mypage({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: tbutton_widget_color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            child,
            style: TextStyle(fontSize: 32),
          ),
        ),
      ),
    );
  }
}