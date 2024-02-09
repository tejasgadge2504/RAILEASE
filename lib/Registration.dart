import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mine_app/main.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:mine_app/Mypage.dart';
import 'package:file_picker/file_picker.dart';
import 'Mypage.dart';
import 'package:firebase_core/firebase_core.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {


  int currentStep = 0;
  bool isCompleted=false;
  TextEditingController Name=TextEditingController();
  TextEditingController Gender=TextEditingController();
  TextEditingController Address=TextEditingController();

  TextEditingController Mobile_No=TextEditingController();
  TextEditingController Email_ID=TextEditingController();
  TextEditingController Admission_Year=TextEditingController();
  TextEditingController Expected_Gradutaion_Year=TextEditingController();
  TextEditingController Branch=TextEditingController();
  TextEditingController Divison=TextEditingController();

  // late DatabaseReference dbRef;
  // dbRef = FirebaseDatabase.instance.ref().child('Applied Users');

  late DatabaseReference dbRef= FirebaseDatabase.instance.ref().child('Applied_Users');

  // @override
  // void initState(){
  //   super.initState();
  //   dbRef = FirebaseDatabase.instance.ref().child('Applied_Users');
  //
  // }

  List<String> selectedDocuments = [];
  List<Step> stepList() =>
      [
        Step(
          isActive: currentStep >= 0,
          title: const Text('Info'),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: Name,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: Gender,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Gender',
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: Address,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address ',
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: Mobile_No,
                  keyboardType: TextInputType.phone,

                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile-No',
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: Email_ID,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email-ID(other than ves-id)',
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? result =
                    await FilePicker.platform.pickFiles(allowMultiple: true);

                    if (result != null) {
                      List<String> paths =
                      result.files.map((file) => file.name ?? '').toList();
                      setState(() {
                        selectedDocuments.addAll(paths);
                      });
                    }
                  },
                  child: Text('Upload Documents'),
                ),
                const SizedBox(height: 8),
                Text('Selected Documents:'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: selectedDocuments
                      .map((document) => Text(document))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        Step(
            isActive: currentStep >= 1,
            title: const Text('Academic \n Info'),
            content: Container(
              child: Column(
                children: [
                  TextField(
                    controller: Admission_Year,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(border: OutlineInputBorder(),
                      labelText: 'Admission Year',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),  TextField(
                    controller: Expected_Gradutaion_Year,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(border: OutlineInputBorder(),
                      labelText: 'Expected Gradutaion Year',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),  TextField(
                    controller: Branch,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(border: OutlineInputBorder(),
                      labelText: 'Branch',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),  TextField(
                    controller: Divison,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(border: OutlineInputBorder(),
                      labelText: 'Division',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            )),
        Step(

          isActive: currentStep >= 2,
          title: const Text('OK'),
          content: Column(

            children: [
              Container(
                child: Image.asset("assets/images/Success.png"),
                height:150 ,
              ),
              // Image.asset("assets/Success.png"),
              // const SizedBox(height: 16),


              SizedBox(height: 30,),

              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Text('Your Request is Successfully accepted \nYou will be notified once your application is being approved via Mail. \n\nThankyou !!'),


                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0 - 9.0),


                ),


              ),
  const SizedBox(height: 12),
  ElevatedButton(
    child: Text('SUBMIT'),
    onPressed: (){
      Map<String , String> Applied_Users ={
        'Name': Name.text,
        'Gender': Gender.text,
        'Address':Address.text,
        'Mobile-No':Mobile_No.text,
        'Mail-ID':Email_ID.text,
      };
      dbRef.push().set(Applied_Users);
    },
    ),
    ],
          ),
        ),


      ];

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text("New User Registration"),
        ),
        body: Stepper(

            type: StepperType.horizontal,
            steps: stepList(),
            currentStep: currentStep,
            onStepContinue: () {
              final isLastStep = currentStep == stepList().length - 1;
              if (isLastStep) {
                print('COMPLETED');
              } else {
                setState(() => currentStep += 1);
              }
            },
            onStepCancel: () {

              if (currentStep > 0) {
                setState(() => currentStep -= 1);
              }
            }
//
// controlsBuilder: (context, onStepContinue) {
//   return Container(
//    child: Row(
//   children: [
//     Expanded(child: ElevatedButton(
//     child: Text('Next'),
//     onPressed: onStepContinue,
//     ),
//     ),
//     const SizedBox(width: 12),
//     Expanded(child: ElevatedButton(
//     child: Text('Cancel'),
//     onPressed: onStepCancel,
//     ),
//     ),
//     ],
//   ),
//   );
// },
        ),
    );

  }
}