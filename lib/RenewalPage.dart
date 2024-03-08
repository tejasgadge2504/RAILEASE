import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mine_app/Consessionmsg.dart';


class RenewalPage extends StatefulWidget {
  final Map<dynamic, dynamic> userData;

  RenewalPage({Key? key, required this.userData}) : super(key: key);
  @override
  _RenewalPageState createState() => _RenewalPageState();
}

class _RenewalPageState extends State<RenewalPage> {
  String? _selectedPassType;
  String? _selectedClassType;
  DateTime? _selectedDate;
  TextEditingController _previousPassNumberController = TextEditingController();
  var application =0;
  final databaseRef = FirebaseDatabase.instance.ref('Consession Req');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Concession Request'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Pass Type:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Column(
                children: <Widget>[
                  RadioListTile<String>(
                    title: const Text('Monthly'),
                    value: 'Monthly',
                    groupValue: _selectedPassType,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPassType = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Quarterly'),
                    value: 'Quarterly',
                    groupValue: _selectedPassType,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPassType = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Select Train Class Type:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Column(
                children: <Widget>[
                  RadioListTile<String>(
                    title: const Text('First class'),
                    value: 'First class',
                    groupValue: _selectedClassType,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedClassType = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Second class'),
                    value: 'Second class',
                    groupValue: _selectedClassType,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedClassType = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Select Date:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      setState(() {
                        _selectedDate = selectedDate;
                      });
                    }
                  });
                },
                child: Text(_selectedDate != null ? _selectedDate!.toString().split(' ')[0] : 'Select Date'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _previousPassNumberController,
                decoration: InputDecoration(
                  labelText: 'Enter Previous Pass Number',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if(_selectedPassType.toString().isEmpty||_selectedClassType.toString().isEmpty||_selectedDate.toString().isEmpty||_previousPassNumberController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please Fill all the Fields correctly'),
                      duration: Duration(seconds: 2),));
                    return;  // dont proceed adding data
                  }
                  String PriKey = '${widget.userData['Key']}';

                  databaseRef.child(PriKey).set({
                    'Name':widget.userData['Name'].toString().toUpperCase(),
                    'Address':widget.userData['Address'].toString().toUpperCase(),
                    'VES_ID':widget.userData['VES_ID'].toString().toLowerCase(),
                    'Branch':widget.userData['Branch'].toString().toUpperCase(),
                    'Division':widget.userData['Division'].toString().toUpperCase(),
                    'Pass_Type':_selectedPassType.toString().toUpperCase(),
                    'Class_Type':_selectedClassType.toString().toUpperCase(),
                    'Appli_Date':_selectedDate.toString().toUpperCase(),
                    'Prev_Pass_no':_previousPassNumberController.text.toString().toUpperCase(),
                    // 'No_Application':application.toString().toUpperCase(),

                  });





                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return FractionallySizedBox(
                        heightFactor: 0.5,
                        child: Consessionmsg(),
                      );
                    },
                  );
                },
                child: Text('Apply'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
