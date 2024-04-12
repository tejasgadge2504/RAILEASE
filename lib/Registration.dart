import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mine_app/regDone.dart';
import 'package:rxdart/utils.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  int currentStep = 0;
  bool isCompleted=false;
  bool isLoading = false; // Flag to track loading state

  TextEditingController Name=TextEditingController();
  TextEditingController Gender=TextEditingController();
  TextEditingController Address=TextEditingController();
  TextEditingController Mobile_No=TextEditingController();
  TextEditingController Email_ID=TextEditingController();
  TextEditingController Admission_Year=TextEditingController();
  TextEditingController Expected_Graduation_Year=TextEditingController();
  TextEditingController Branch=TextEditingController();
  TextEditingController Divison=TextEditingController();
  TextEditingController VES_ID = TextEditingController();
  TextEditingController RollNo = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref('Reg Users');
  List<String> selectedDocuments = [];

  @override
  void initState() {
    super.initState();
    // Add listener to Admission Year field controller
    Admission_Year.addListener(updateExpectedGraduationYear);
  }

  void updateExpectedGraduationYear() {
    String admissionYear = Admission_Year.text;
    if (admissionYear.isNotEmpty) {
      int admissionYearInt = int.tryParse(admissionYear) ?? 0;
      int expectedGraduationYear = admissionYearInt + 4;
      Expected_Graduation_Year.text = expectedGraduationYear.toString();
    }
  }

  @override
  void dispose() {
    // Clean up controllers and remove listener
    Admission_Year.removeListener(updateExpectedGraduationYear);
    Name.dispose();
    Gender.dispose();
    Address.dispose();
    Mobile_No.dispose();
    Email_ID.dispose();
    Admission_Year.dispose();
    Expected_Graduation_Year.dispose();
    Branch.dispose();
    Divison.dispose();
    VES_ID.dispose();
    RollNo.dispose();
    super.dispose();
  }

  Future<void> registerUser() async {
    setState(() {
      isLoading = true; // Set loading state to true
    });

    // Your registration logic here
    // Simulating registration with delay
    await Future.delayed(Duration(seconds: 2));

    // Navigate to RegDone page after registration
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RegDone()),
    );

    setState(() {
      isLoading = false; // Reset loading state after registration
    });
  }

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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'VES-ID',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: Admission_Year,
                  keyboardType: TextInputType.number,
                  onChanged: (admissionYear) {
                    // Calculate expected graduation year when admission year changes
                    if (admissionYear.isNotEmpty) {
                      int admissionYearInt = int.tryParse(admissionYear) ?? 0;
                      int expectedGraduationYear = admissionYearInt + 4;
                      Expected_Graduation_Year.text = expectedGraduationYear.toString();
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Admission Year',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: Expected_Graduation_Year,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Expected Graduation Year',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: Branch,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Branch',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: Divison,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Division',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: RollNo,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Roll Number',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!isValidVESID(VES_ID.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid VES ID. You are not a Student Of VESIT.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return; // Don't proceed adding data
                    }

                    if (Name.text.isEmpty || Gender.text.isEmpty || Address.text.isEmpty || Mobile_No.text.isEmpty || Email_ID.text.isEmpty || VES_ID.text.isEmpty || Admission_Year.text.isEmpty || Expected_Graduation_Year.text.isEmpty || Branch.text.isEmpty || Divison.text.isEmpty || RollNo.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please Fill all the Fields correctly'),
                        duration: Duration(seconds: 2),));
                      return;  // don't proceed adding data
                    }

                    isLoading ? null : registerUser(); // Disable button when loading

                    String PriKey = RollNo.text + "_" + Divison.text;

                    databaseRef.child(PriKey).set({
                      'Name':Name.text.toUpperCase().toString(),
                      'Gender':Gender.text.toString().toUpperCase(),
                      'Address':Address.text.toString().toUpperCase(),
                      'Mobile-No':Mobile_No.text.toString(),
                      'Email-ID':Email_ID.text.toString(),
                      'VES_ID':VES_ID.text.toLowerCase().toString(),
                      'Admission Year':Admission_Year.text.toString(),
                      'Graduation Year':Expected_Graduation_Year.text.toString(),
                      'Branch':Branch.text.toString().toUpperCase(),
                      'Division':Divison.text.toString().toUpperCase(),
                      'Roll No':RollNo.text.toString().toUpperCase(),
                    });

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => RegDone(),
                      ),
                    );

                  },
                  child: isLoading
                      ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                      :Text('Submit'),
                ),

              ],
            ),
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
      ),
    );
  }

  bool isValidVESID(String vesID) {
    // Regular expression to match the VES ID format
    RegExp regex = RegExp(r'^d?20\d{2}\.[a-zA-Z]+\.[a-zA-Z]+@ves\.ac\.in$');

    return regex.hasMatch(vesID);
  }
}
