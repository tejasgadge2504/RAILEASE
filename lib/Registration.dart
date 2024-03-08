import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:rxdart/utils.dart';

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
  TextEditingController VES_ID = TextEditingController();
  TextEditingController RollNo = TextEditingController();


  // @override
  // void dispose(){
  //
  // }
   bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Reg Users');

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
                  keyboardType: TextInputType.text,
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
                  keyboardType: TextInputType.number,

                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile-No',
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: Email_ID,
                  keyboardType: TextInputType.text,

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
                    controller: VES_ID,
                    keyboardType: TextInputType.text,

                    decoration: const InputDecoration(border: OutlineInputBorder(),
                      labelText: 'VES-ID',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: Admission_Year,
                    keyboardType: TextInputType.number,

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
                  TextField(
                    controller: RollNo,
                    keyboardType: TextInputType.number,

                    decoration: const InputDecoration(border: OutlineInputBorder(),
                      labelText: 'Roll Number',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(onPressed: (){

                    if(Name.text.isEmpty||Gender.text.isEmpty||Address.text.isEmpty||Mobile_No.text.isEmpty||Email_ID.text.isEmpty||VES_ID.text.isEmpty||Admission_Year.text.isEmpty||Expected_Gradutaion_Year.text.isEmpty||Branch.text.isEmpty||Divison.text.isEmpty||RollNo.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please Fill all the Fields correctly'),
                      duration: Duration(seconds: 2),));
                      return;  // dont proceed adding data
                    }

                    String PriKey = RollNo.text + "_" + Divison.text;

                    databaseRef.child(PriKey).set({
                      'Name':Name.text.toUpperCase().toString(),
                      'Gender':Gender.text.toString().toUpperCase(),
                      'Address':Address.text.toString().toUpperCase(),
                      'Mobile-No':Mobile_No.text.toString(),
                      'Email-ID':Email_ID.text.toString(),
                      'VES_ID':VES_ID.text.toLowerCase().toString(),
                      'Admission Year':Admission_Year.text.toString(),
                      'Graduation Year':Expected_Gradutaion_Year.text.toString(),
                      'Branch':Branch.text.toString().toUpperCase(),
                      'Division':Divison.text.toString().toUpperCase(),
                      'Roll No':RollNo.text.toString().toUpperCase(),
                    });
                  }, child: Text('Submit')),
                ],
              ),
            )),
        // Step(
        //   isActive: currentStep >= 2,
        //   title: const Text('OK'),
        //   content: Column(
        //     children: [
        //       Container(
        //         child: Image.asset("assets/images/Success.png"),
        //         height:150 ,
        //       ),
        //       // Image.asset("assets/Success.png"),
        //       // const SizedBox(height: 16),
        //
        //
        //       SizedBox(height: 30,),
        //
        //       SizedBox(height: 30),
        //       ElevatedButton(
        //         onPressed: () {
        //           // Navigator.pushReplacementNamed(context, '/');
        //         },
        //         child: Text('Your Request is Successfully accepted \nYou will be notified once your application is being accepted via Mail. \n\nThankyou !!'),
        //
        //
        //         style: ElevatedButton.styleFrom(
        //           primary: Colors.blue,
        //           onPrimary: Colors.white,
        //           padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0 - 9.0),
        //
        //
        //         ),
        //
        //
        //       ),
        //       SizedBox(height: 30,),
        //

        //     ],
        //   ),
        // ),


      ];

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text("New User Registration"),
        ),
        body: Stepper(
            type: StepperType.vertical,
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
            },


        )
    );

  }
}