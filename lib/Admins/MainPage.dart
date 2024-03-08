import 'package:flutter/material.dart';
import 'package:mine_app/Admins/Concession_manage.dart';
import 'package:mine_app/Admins/MonthlyReportPage.dart';
import 'package:mine_app/Admins/RegisteredUsers.dart';
import 'package:mine_app/Admins/approvedUsers.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:mine_app/Admins/Admin.dart';
import 'package:mine_app/Admins/SlideBarA.dart';

class MainPage extends StatelessWidget {
  final List<String> listPosts = [
    'Concession Request Management',
    'Registered Users',
    'Approved Users ',
    'Monthly Report',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
       drawer: Drawer(
         child: SlideBarA(),
       ),
      appBar: AppBar(
        backgroundColor: tAppbar_color.shade200,
        title: Text('RAILEASE'),
        actions: [
          Row(
            children: [
              Text('Welcome Admin'),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person_2_rounded),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listPosts.length,
        itemBuilder: (context, index) {
          if (listPosts[index] == 'Concession Request Management') {
            // Pass a callback function to handle navigation to Registration
            return Admin(
              child: listPosts[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Concessionmanagement()),
                );
              },
            );
          }

          else if (listPosts[index] == 'Registered Users') {
            // Pass a callback function to handle navigation to Registration
            return Admin(
              child: listPosts[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegUsers() ),
                );
              },
            );
          }

          else if (listPosts[index] == 'Monthly Report') {
            // Pass a callback function to handle navigation to Registration
            return Admin(
              child: listPosts[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MonthlyReportPage()),
                );
              },
            );
          }

          else if (listPosts[index] == 'Approved Users') {
            // Pass a callback function to handle navigation to Registration
            return Admin(
              child: listPosts[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ApprovedUsers()),
                );
              },
            );
          }

          else if (listPosts[index] == 'Monthly Report') {
            // Pass a callback function to handle navigation to Registration
            return Admin(
              child: listPosts[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MonthlyReportPage()),
                );
              },
            );
          }

          else {
            return Admin(
              child: listPosts[index],
              onTap: () {},
            );
          }
        },
      ),
    );
  }
}
