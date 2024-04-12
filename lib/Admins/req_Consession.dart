// import 'dart:js';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:mine_app/Admins/viewMore.dart';

class ReqConsession extends StatefulWidget {
  const ReqConsession({Key? key}) : super(key: key);

  @override
  State<ReqConsession> createState() => _ReqConsessionState();
}

class _ReqConsessionState extends State<ReqConsession> {

  Query dbRef = FirebaseDatabase.instance.ref().child('Consession Req');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Consession Req');
  DatabaseReference approvedUsersReference = FirebaseDatabase.instance.ref().child('Approved Consession');


  Future<void> sendEmailConfirmation(String vesId,String name) async {
    String username = 'teaminspire2226@gmail.com'; // Replace with your email
    String password = 'xdrc zrav loyu yvsf'; // Replace with your email password

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'RAILEASE - TEJAS GADGE ')
      ..recipients.add(vesId) // Assuming vesId is the email address
      ..subject = 'Approval Confirmation'
      ..text = 'Congratulations ${name}! \n This is to inform you that your railway concession application has been approved by VR Administrator.\nYou are requested to collect it from your college concession desk by providing the following details:\nNew concession pass number:XXXXX  and Booklet Number XXXX.\n Make sure that you collect the concession form before 3 days from today or else your concession will be considered as an invalid application and no new concession will be granted.\nWhile collecting concession form, College ID Card is compulsory.\nThank you \nTeam RAILEASE';

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
            '${student['Class_Type']} - ${student['Pass_Type']}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ElevatedButton(
              //   onPressed: () {
              //
              //     //EDIT LOGIC
              //
              //   },
              //   child: Text('Edit'),
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.yellow,
              //   ),
              // ),
              const SizedBox(
                width: 6,
              ),
              ElevatedButton(
                onPressed: () {

                  //APPROVE APPLICATION
                  // Move the approved user to the 'Approved Users' database
                  reference.child(student['Key']).remove(); // Remove from 'Consession Req'
                  approvedUsersReference.child(student['Key']).set(student); // Add to 'Approved Consession'

                  // Send email confirmation
                  sendEmailConfirmation(student['VES_ID'],student['Name']);

                },
                child: Text('Approve'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
              ),

              const SizedBox(
                width: 6,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context as BuildContext,
                    MaterialPageRoute(builder: (context) => ViewMore(userData: student) ),
                  );
                  //SEEN THE DETAILS

                },
                child: Text('View'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
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
          title: const Text('Consession Request'),
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
