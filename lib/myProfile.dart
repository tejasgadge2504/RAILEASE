
import 'package:flutter/material.dart';
import 'package:mine_app/src/constants/colors.dart';


class ProfilePage extends StatefulWidget {

  final Map<dynamic, dynamic> userData;

  ProfilePage({Key? key, required this.userData}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tAppbar_color.shade200,
        title: Row(
          children: [
            // CircleAvatar(
            //   backgroundImage: AssetImage('assets/profile_picture.jpg'),
            //
            // ),
            Icon(Icons.person),
            SizedBox(width: 10.0),
            Text('Profile', style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // CircleAvatar(
                //   radius: 60,
                //   backgroundImage: AssetImage('assets/big_profile_photo.jpg'),
                //
                // ),

                Icon(Icons.person,size: 100),


                SizedBox(height: 16.0),
                Text(
                  'WELCOME',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),


                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: tAppbar_color.shade100,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          width: 2
                      )
                  ),
                  child: Center(
                    child: Text(
                      '${widget.userData['Name']}',
                      style: TextStyle(fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                SizedBox(height: 50.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Roll No: ',
                      style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '${widget.userData['Roll No']}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),

                SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Branch: ',
                      style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '${widget.userData['Branch']}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),

                SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'VES_ID:\n${widget.userData['VES_ID']}',
                      style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width: 8.0),
                  ],
                ),

                SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone No: ',
                      style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '${widget.userData['Mobile-No']}',
                      style: TextStyle(fontSize: 18.0),
                    ),

                  ],
                ),

                SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Suburb: ',
                      style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '${widget.userData['Address']}',
                      style: TextStyle(fontSize: 18.0),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}