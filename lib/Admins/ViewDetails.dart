import 'dart:ffi';

import 'package:mine_app/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:mine_app/Admins/Concession_manage.dart';

class ViewDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tAppbar_color.shade200,
        title: Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 8.0,),
            Text(' View Details',style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name : ', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text('College Email : ', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text('Phone : ', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text('Address : ', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text('Other E-Mail : ', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text('Documents:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.file_copy_rounded),
                SizedBox(width: 8.0),
                Text('Document 1.pdf'),],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.file_copy_rounded),
                SizedBox(width: 8.0),
                Text('Document 2.pdf'),
              ],
            ),
            SizedBox(height: 8.0),
            Text('Admission Year : ', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text('Graduation Year : ', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text('Division : ', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text('Branch : ', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),

            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: Container(
                        height: 200,// Adjust height as needed
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(12),
                              color: Colors.black45,
                              child: Text(
                                'Please take an action from below !',
                                style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold,),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              padding: EdgeInsets.all(20),
                              height: 80,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Approve'),
                                  ),
                                  SizedBox(width: 30),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Reject'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text('Admin Actions'),
            ),

          ],
        ),
      ),
    );
  }
}