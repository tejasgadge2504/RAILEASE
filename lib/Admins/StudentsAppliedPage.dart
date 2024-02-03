import 'package:flutter/material.dart';
import 'MonthlyReportPage.dart';


class StudentsAppliedPage extends StatefulWidget {
  final String month;

  StudentsAppliedPage({required this.month});

  @override
  _StudentsAppliedPageState createState() => _StudentsAppliedPageState();
}

class _StudentsAppliedPageState extends State<StudentsAppliedPage> {
  // Original list of students
  final List<String> allStudents = [
    'Deepak ',
    'Tejas',
    'Ganesh',
    'Vedant',
    'Vedang',
    'Neel',
    'Kushl',
    'Datta',
    // Add more students as needed
  ];

  // Filtered list based on search query
  List<String> filteredStudents = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list with all students
    filteredStudents = allStudents;
  }

  void filterStudents(String query) {
    // Update the filtered list based on the search query
    setState(() {
      filteredStudents = allStudents
          .where((student) => student.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students Applied - ${widget.month}'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search for a student',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                filterStudents(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredStudents.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredStudents[index]),
                  // Add more details or actions for each student if needed
                );
              },
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     // Implement your logic for "Done" button
          //     // This could be used to perform an action or close the page
          //   },
          //   child: Text('Done'),
          // ),
        ],
      ),
    );
  }
}

void main(){
  runApp(MaterialApp(home: MonthlyReportPage(),));
}