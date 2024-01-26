import 'package:flutter/material.dart';

class TrainPassHistoryPage extends StatefulWidget {
  @override
  _TrainPassHistoryPageState createState() => _TrainPassHistoryPageState();
}

class _TrainPassHistoryPageState extends State<TrainPassHistoryPage> {
  List<TrainPassApplication> passHistory = [
    TrainPassApplication('Jan', 'Monthly Pass', '2022-01-01', '123', '456'),
    TrainPassApplication('Feb', 'Quaterly Pass', '2022-02-15', '789', '012'),
    // Add more entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    print('Building TrainPassHistoryPage');
    return Scaffold(
      appBar: AppBar(
        title: Text('Train Pass History'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add your text widgets here
            Text(
              'Name: Deepak Kumbhar',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Division: D7B',
              style: TextStyle(fontSize: 18),
            ),
            // Add more text widgets as needed

            // Add some space between text and DataTable
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Month')),
                  DataColumn(label: Text('Applied On')),
                  DataColumn(label: Text('Application Id')),
                  DataColumn(label: Text('Pass Number')),
                  DataColumn(label: Text('Previous Pass Number')),
                ],
                rows: passHistory.map((application) {
                  return DataRow(
                    cells: [
                      DataCell(Text(application.month)),
                      DataCell(Text(application.appliedOn)),
                      DataCell(Text(application.applicationId)),
                      DataCell(Text(application.passNumber)),
                      DataCell(Text(application.previousPassNumber)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrainPassApplication {
  final String month;
  final String appliedOn;
  final String applicationId;
  final String passNumber;
  final String previousPassNumber;

  TrainPassApplication(
      this.month,
      this.appliedOn,
      this.applicationId,
      this.passNumber,
      this.previousPassNumber,
      );
}
