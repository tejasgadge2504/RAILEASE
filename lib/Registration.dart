import 'package:flutter/material.dart';
import 'package:mine_app/main.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:mine_app/Mypage.dart';
import 'package:file_picker/file_picker.dart';

import 'Mypage.dart';

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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: Gender,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Gender',
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: Address,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address ',
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: Mobile_No,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile-No',
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: Email_ID,
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
                      result.files.map((file) => file.path!).toList();
                      setState(() {
                        selectedDocuments = paths;
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
            isActive: currentStep >= 2,
            title: const Text('Academic Info'),
            content: Container(
              child: Column(
                children: [
                  TextField(
                    controller: Admission_Year,
                    decoration: const InputDecoration(border: OutlineInputBorder(),
                      labelText: 'Admission Year',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),  TextField(
                    controller: Expected_Gradutaion_Year,
                    decoration: const InputDecoration(border: OutlineInputBorder(),
                      labelText: 'Expected Gradutaion Year',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),  TextField(
                    controller: Branch,
                    decoration: const InputDecoration(border: OutlineInputBorder(),
                      labelText: 'Branch',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),  TextField(
                    controller: Divison,
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
          isActive: currentStep >= 3,
          title: const Text('Confirm'),
          content: Column(
            children: [
              Container(
                child: Image.asset("assets/images/Success.png"),
                height:150 ,
              ),
              // Image.asset("assets/Success.png"),
              // const SizedBox(height: 16),


              SizedBox(height: 30,),

              ElevatedButton(
                onPressed: () {
                  // Navigate to the home page or perform any other action
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) =>MyHomePage()
                  //
                  //   ),
                  // );

                },
                child: Text('Your Request is Successfully accepted \nYou will be notified once your application is being accepted via Mail. \n\nThankyou !!'),


                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0 - 9.0),


                ),


              )],
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

        )
    );

  }
}