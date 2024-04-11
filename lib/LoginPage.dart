import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mine_app/main.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:mine_app/src/constants/strings.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;
  bool loginSuccessful = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: tlogin_color.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.1,),
              Row(
                children: [
                  SizedBox(width: size.width * 0.47,),
                  Icon(Icons.important_devices, size: 65.0,),
                ],
              ),
              SizedBox(height: size.height * 0.02,),
              Text('LOGIN',
                style: TextStyle(fontWeight: FontWeight.w600,
                    fontSize: 65,
                    color: tlogin_title_color),),
              Text('Please use correct credentials',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center),
              Form(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.05,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: tEmail_Input,
                        suffixStyle: TextStyle(fontWeight: FontWeight.w900),
                        hintText: tEmail_Input,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: tButton_border)),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    TextFormField(
                      obscureText: passToggle,
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        labelText: tpasswd_Input,
                        suffixStyle: TextStyle(fontWeight: FontWeight.w900),
                        hintText: tpasswd_Input,
                        prefixStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: tButton_border)),
                        suffixIcon: IconButton(
                          onPressed: () {
                            // Toggle password visibility
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          icon: Icon(
                            passToggle ? Icons.visibility_off : Icons.visibility,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(
                            fontSize: 16,
                            color: tforgot_password.shade400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.1),
                    SizedBox(
                      width: size.width * 0.5,
                      height: size.height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                          validateAndNavigate(context);
                        },
                        child: Text('LOGIN'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateAndNavigate(BuildContext context) async {
    String enteredEmail = emailController.text.trim();
    String enteredPassword = passwordController.text.trim();

    // Check if email matches the specified format
    if (!isValidEmailFormat(enteredEmail)) {
      showInvalidEmailDialog(context);
      return;
    }

    DatabaseReference approvedUsersReference =
    FirebaseDatabase.instance.ref().child('Approved Users');

    try {
      DatabaseEvent event = await approvedUsersReference.once();
      DataSnapshot snapshot = event.snapshot;
      Map<dynamic, dynamic>? approvedUsersData =
      snapshot.value as Map<dynamic, dynamic>?;

      if (approvedUsersData != null) {
        approvedUsersData.forEach((key, value) {
          if (value['VES_ID'] == enteredEmail &&
              value['Mobile-No'] == enteredPassword) {
            Navigator.of(context).pushReplacement(_createRoute(value));
            loginSuccessful = true; // Set flag to true for successful login
            return;
          }
        });
      }

      if (!loginSuccessful) {
        showInvalidCredentialsDialog(context);
      }
    } catch (error) {
      print("Error fetching data: $error");
      if (!loginSuccessful) {
        showInvalidCredentialsDialog(context);
      }
    }
  }

  bool isValidEmailFormat(String email) {
    RegExp regex = RegExp(r'^d?20\d{2}\.[a-zA-Z]+\.[a-zA-Z]+@ves\.ac\.in$');
    return regex.hasMatch(email);
  }

  void showInvalidEmailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Invalid Email"),
          content: Text("You are not Student Of VESIT."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void showInvalidCredentialsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Invalid Credentials"),
          content: Text("Please enter valid credentials."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Route _createRoute(Map<dynamic, dynamic> userData) {
    return MaterialPageRoute(
      builder: (context) => MyHomePage(userData: userData),
    );
  }
}
