import 'package:flutter/material.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:mine_app/Admins/Admin.dart';
import 'package:mine_app/Admins/SlideBarA.dart';
import 'MonthlyReportPage.dart';

class MonthlyReportPage extends StatelessWidget {
  // This is a placeholder; you'll need to replace it with your actual implementation.
  // You might want to use GridView or ListView to display the months and options.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Report'),
      ),
      body: Center(
        child: Text('Monthly Report Page Content'),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  final List<String> listPosts = [
    'Concession Request',
    'User Management',
    'Notification Management',
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
          if (listPosts[index] == 'Monthly Report') {
            return Admin(
              child: listPosts[index],
              onTap: () {
                // Navigate to the MonthlyReportPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MonthlyReportPage()),
                );
              },
            );
          } else {
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

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
