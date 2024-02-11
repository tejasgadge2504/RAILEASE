import 'package:flutter/material.dart';
import 'package:mine_app/src/constants/colors.dart';

class AdminProfilePage extends StatelessWidget {
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
            SizedBox(width: 8.0),
            Text('Profile', style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white,
            ),),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(24.0),
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
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      color: tAppbar_color.shade700,
                      borderRadius: BorderRadius.circular(20.0),
                      // border: Border.all( width: 2 )
                  ),
                  child: Text( 'Admin', style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold, color: Colors.white,),
                  ),
                ),




                SizedBox(height: 50.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID No:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width: 8.0),
                    Text('123', style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),

                SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width: 8.0),
                    Text('XYZ', style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),

                SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width: 8.0),
                    Text('Admin@gmail.com', style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),

                // SizedBox(height: 8.0),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       'Phone No:',
                //       style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold ),
                //     ),
                //     SizedBox(width: 8.0),
                //     Text(
                //       '987xx xx123',
                //       style: TextStyle(fontSize: 18.0),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
