
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ConcessionApproved extends StatefulWidget {
  const ConcessionApproved({Key? key}) : super(key: key);

  @override
  State<ConcessionApproved> createState() => _ConcessionApprovedState();
}

class _ConcessionApprovedState extends State<ConcessionApproved> {

  Query dbRef = FirebaseDatabase.instance.ref().child('Approved Consession');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Approved Consession');
  // DatabaseReference approvedUsersReference = FirebaseDatabase.instance.ref().child('Approved Users');


  Widget listItem({required Map student}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      color: Colors.deepPurpleAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            student['Name'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            student['VES_ID'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            student['Branch'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.white),
          ),

          // ===================

          ElevatedButton(onPressed:(){
            _generatePDF(student['Name']);
          } ,
          child:
          Text('Print',style: TextStyle(fontWeight: FontWeight.bold),),
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Granted Consession'),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {


              Map student = snapshot.value as Map;
              student['Key'] = snapshot.key;

              return listItem(student: student);

            },
          ),
        )
    );
  }


// Add the following function to your _ConcessionApprovedState class
//   Future<void> _generatePDF() async {
//     PdfDocument document = PdfDocument();
//     document.pages.add();
//
//     List<int> bytes = document.save();
//     document.dispose();
//
//     saveAndLaunchFile(bytes, 'output.pdf');
//
//   }

// Add the following function to your _ConcessionApprovedState class
  Future<void> _generatePDF(String name) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(name),
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/$name.pdf");
    await file.writeAsBytes(await pdf.save());

    // Open the generated PDF file using platform specific method
    OpenFile.open(file.path);
  }

}
