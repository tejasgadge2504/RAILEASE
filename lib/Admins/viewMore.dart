
import 'package:flutter/material.dart';
import 'package:mine_app/src/constants/colors.dart';


class ViewMore extends StatefulWidget {


  final Map userData ;
  //
  // ViewMore({Key? key, required this.userData}) : super(key: key);
  const ViewMore({Key? key, required this.userData}) : super(key: key);


  @override
  State<ViewMore> createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  // student['Key'] = snapshot.key;
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
            Text('Details', style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
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


                SizedBox(height: 16.0),


                SizedBox(height: 50.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name:',
                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '${widget.userData['Name']}',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),

                SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Division:',
                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '${widget.userData['Division']} - ${widget.userData['Branch']}',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),


                SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Class Type:',
                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '${widget.userData['Class_Type']}',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),


                SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pass Type:',
                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '${widget.userData['Pass_Type']}',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),

                SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'VES-ID:',
                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '${widget.userData['VES_ID']}',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),



                SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Suburb:',
                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '${widget.userData['Address']}',
                      style: TextStyle(fontSize: 15.0),
                    ),


                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'To:',
                      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Kurla',
                      style: TextStyle(fontSize: 15.0),
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