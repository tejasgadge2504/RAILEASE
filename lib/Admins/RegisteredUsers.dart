// import 'dart:js';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class RegUsers extends StatefulWidget {
  const RegUsers({Key? key}) : super(key: key);

  @override
  State<RegUsers> createState() => _RegUsersState();
}

class _RegUsersState extends State<RegUsers> {

  Query dbRef = FirebaseDatabase.instance.ref().child('Reg Users');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Reg Users');
  DatabaseReference approvedUsersReference = FirebaseDatabase.instance.ref().child('Approved Users');


  Future<void> sendEmailConfirmation(String vesId,String pass,String name) async {
    String username = 'teaminspire2226@gmail.com'; // Replace with your email
    String password = 'xdrc zrav loyu yvsf'; // Replace with your email password

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'RAILEASE - TEJAS GADGE ')
      ..recipients.add(vesId) // Assuming vesId is the email address
      ..subject = 'Approval Confirmation'
      ..text = 'Congratulations ${name}! \n Your registration has been approved.\n You can now login using following Credentials \n login: ${vesId}\n Password:${pass}\n Thankyou\n Team RAILEASE';

    try {
      await send(message, smtpServer);
      print('Email sent successfully');
    } catch (error) {
      print('Error sending email: $error');
    }
  }


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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {

              //EDIT LOGIC

                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {

                  //APPROVE APPLICATION
                  // Move the approved user to the 'Approved Users' database
                  reference.child(student['Key']).remove(); // Remove from 'Reg Users'
                  approvedUsersReference.child(student['Key']).set(student); // Add to 'Approved Users'

                  // Send email confirmation
                  sendEmailConfirmation(student['VES_ID'],student['Mobile-No'],student['Name']);

                },
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.lightGreenAccent,
                      weight: Checkbox.width,
                      size: 30,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context as BuildContext,
                  //   MaterialPageRoute(builder: (context) =>viewMore),
                  // );
                  //SEEN THE DETAILS

                },
                child: Row(
                  children: [
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      weight: Checkbox.width,
                      size: 30,
                    ),
                  ],
                ),
              ),

            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registered users'),
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
