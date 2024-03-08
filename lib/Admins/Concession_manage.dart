import 'package:flutter/material.dart';
import 'package:mine_app/Admins/ViewDetails.dart';
import 'package:mine_app/src/constants/colors.dart';

class Concessionmanagement extends StatefulWidget {
  @override
  _ConcessionmanagementState createState() => _ConcessionmanagementState();
}

class _ConcessionmanagementState extends State<Concessionmanagement> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tAppbar_color.shade200,
        title: Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 8.0),
            Text(
              'Concession Request',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Handle search functionality here
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  buildUserTile('Vedant Mhatre'),
                  buildUserTile('Deepak Kumbhar'),
                  buildUserTile('Parth Patil'),
                  buildUserTile('Tejas Gadge'),
                  buildUserTile('Ganesh Shelar'),
                  buildUserTile('Tanmay Maity'),
                  buildUserTile('Abhishek Butkeshwar'),
                  buildUserTile('Gaurav Mhatre'),
                  buildUserTile('Vedant Patil'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUserTile(String userName) {
    if (searchQuery.isNotEmpty && !userName.toLowerCase().contains(searchQuery.toLowerCase())) {
      return SizedBox.shrink();
    }

    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userName, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewDetails(),));
                    },
                    child: Text('View Details'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
