import 'package:flutter/material.dart';
import 'package:mine_app/RenewalPage.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:mine_app/stepsToApply.dart';
import 'package:mine_app/Approval.dart';
import 'package:mine_app/e-history.dart';



class Mypage extends StatefulWidget {


  final String child;
  final VoidCallback onTap;


  final Map<dynamic, dynamic> userData;

  Mypage({Key? key, required this.userData,required this.child, required this.onTap}) : super(key: key);


  // Mypage({});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
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
              if (widget.child == 'Apply for Consession') {
                // Handle navigation to Registration
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RenewalPage(),));
              }
              else if (widget.child == 'E-History') {
                // Handle navigation to TrainPassHistoryPage (E-History page)
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TrainPassHistoryPage(userData: widget.userData ,)));
              }

              if (widget.child == 'Steps to Apply') {
                // Handle navigation to Registration
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyStepsPage(),));
              }
              if (widget.child == 'Application Status') {
                // Handle navigation to Registration
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => Approval(),));
              }
              if (widget.child =='Steps to Apply'){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>MyStepsPage()));
              }
              else {

                // Handle other actions if needed
              }
            },
    child: Text(
      widget.child,
    style: TextStyle(fontSize: 32),
    ),
    ),
    ),
      );
  }
}