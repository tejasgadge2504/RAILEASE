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
            Row(
              children: [
                SizedBox(width: 10),
                _buildInfoBox('Name: Deepak Kumbhar'),
              ],
            ),
            SizedBox(width: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                children: [
                  _buildInfoBox("Address:D/302, Vinayakeshwar Complex,avinash Gaikwad NagarGaondevi Road,near Shiv Mandir,Badlapur (east)")
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: 10),
                _buildInfoBox('Division: D7B'),
                SizedBox(width: 10),
                _buildInfoBox('Gender: Male'),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(

                children: [
                   SizedBox(width: 10),
                  _buildInfoBox('DOB: 2004-08-05'),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: 10),
                _buildInfoBox('From Station: Badlapur'),
                SizedBox(width: 10),
                _buildInfoBox('To Station: Kurla'),
              ],
            ),
            SizedBox(width: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                children: [
                  SizedBox(width: 10),
                  _buildInfoBox("Railway Zone:Central")
                ],
              ),
            ),

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

  Widget _buildInfoBox(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 15),
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
