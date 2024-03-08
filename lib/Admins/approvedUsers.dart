// import 'dart:js';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class ApprovedUsers extends StatefulWidget {
  const ApprovedUsers({Key? key}) : super(key: key);

  @override
  State<ApprovedUsers> createState() => _ApprovedUsersState();
}

class _ApprovedUsersState extends State<ApprovedUsers> {

  Query dbRef = FirebaseDatabase.instance.ref().child('Approved Users');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Approved Users');
  // DatabaseReference approvedUsersReference = FirebaseDatabase.instance.ref().child('Approved Users');




  Widget listItem({required Map student}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      color: Colors.deepPurpleAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            student['Name'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            student['VES_ID'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            student['Branch'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.white),
          ),
          
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Approved users'),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {


              Map student = snapshot.value as Map;
              student['Key'] = snapshot.key;

              return listItem(student: student);

            },
          ),
        )
    );
  }
}
