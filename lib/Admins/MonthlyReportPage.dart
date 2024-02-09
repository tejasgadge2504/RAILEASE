import 'package:flutter/material.dart';
import 'package:mine_app/Admins/MainPage.dart';
import 'package:mine_app/Admins/StudentsAppliedPage.dart';
import 'BlockedUserPage.dart';

class MonthlyReportPage extends StatelessWidget {
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Report'),
      ),
      body: ListView.builder(
        itemCount: months.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(months[index]),
            onTap: () {
              // Navigate to a new page showing options for the selected month
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MonthDetailsPage(month: months[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MonthDetailsPage extends StatelessWidget {
  final String month;

  MonthDetailsPage({required this.month});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details for $month'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 80.0),
            child: Text(
              'Options for $month:',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Action for "Students Applied" for the selected month
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentsAppliedPage(month:month,),
                ),
              );
            },
            child: Text('Students Applied'),
          ),
          SizedBox(height: 20.0), // Adding spacing between buttons
          ElevatedButton(
            onPressed: () {
              // Action for "Blocked User List" for the selected month
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlockedUsersPage(
                    blockedUsers: ['Deepak','Tejas','Ganesh','Vedant'], // Pass your list of blocked users here
                    onUnblock: (String unblockedUser) {
                      // Implement your logic to unblock the user
                      // This callback function will be called when the user is unblocked
                    },
                  ),
                ),
              );
            },
            child: Text('Blocked User List'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MonthlyReportPage(),
  ));
}
