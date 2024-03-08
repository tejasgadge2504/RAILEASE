import 'package:flutter/material.dart';

class TrainPassHistoryPage extends StatefulWidget {

  final Map<dynamic, dynamic> userData;

  TrainPassHistoryPage({Key? key, required this.userData}) : super(key: key);


  @override
  _TrainPassHistoryPageState createState() => _TrainPassHistoryPageState();
}

class _TrainPassHistoryPageState extends State<TrainPassHistoryPage> {
  List<TrainPassApplication> passHistory = [
    TrainPassApplication('-', '- ', '-', '-', '-'),

    // TrainPassApplication('Jan', 'Monthly Pass', '2022-01-01', '123', '456'),
    // TrainPassApplication('Feb', 'Quaterly Pass', '2022-02-15', '789', '012'),
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
                _buildInfoBox('Name: ${widget.userData['Name']}'),
              ],
            ),
            SizedBox(width: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                children: [
                  _buildInfoBox("Address: ${widget.userData['Address']}")
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: 10),
                _buildInfoBox('Division: ${widget.userData['Division']} - ${widget.userData['Branch']}'),
                SizedBox(width: 10),
                _buildInfoBox('Gender: ${widget.userData['Gender']}'),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(

                children: [
                   SizedBox(width: 10),
                  _buildInfoBox('VES-ID: ${widget.userData['VES_ID']}'),
                ],
              ),
            ),

            SizedBox(width: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                children: [
                  SizedBox(width: 10),
                  _buildInfoBox("Alternate E-Mail: ${widget.userData['Email-ID']}")
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: 10),
                _buildInfoBox('From Station: ${widget.userData['Address']}'),
                SizedBox(width: 10),
                _buildInfoBox('To Station: KURLA'),
              ],
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
                rows:
                passHistory.map((application) {
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
