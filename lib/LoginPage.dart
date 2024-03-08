import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mine_app/main.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:mine_app/src/constants/strings.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginPage extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;

  @override
  void dispose() {
    // super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(


      backgroundColor: tlogin_color.shade100,
      body:
      SingleChildScrollView(
        // child: Container(
        //   height: size.height,
        //   width: size.width,
        //   color: tlogin_color.shade100 ,

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
                            borderRadius: BorderRadius.all(Radius.circular(
                                20.0)), borderSide: BorderSide(
                            color: tButton_border)),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    TextFormField(
                      obscureText: passToggle,
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        labelText: tpasswd_Input,
                        suffixStyle: TextStyle(fontWeight: FontWeight.w900),
                        hintText: tpasswd_Input,
                        prefixStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                                20.0)), borderSide: BorderSide(
                            color: tButton_border)),
                        suffixIcon: Icon(Icons.remove_red_eye,),
                        //
                        //
                        //
                        // InkWell(
                        //     onTap: (){
                        //       passToggle=false;
                        //     },
                        //     child:
                        //
                        // ),


                      ),
                    ),


                    SizedBox(height: size.height * 0.03),
                    Align(
                      alignment: Alignment.centerRight, // Align to the center
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
                          // Navigator.of(context).pushReplacement(_createRoute());
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
    String enteredVESID = emailController.text.trim();
    String enteredMobileNo = passwordController.text.trim();

    DatabaseReference approvedUsersReference =
    FirebaseDatabase.instance.ref().child('Approved Users');

    try {
      DatabaseEvent event = await approvedUsersReference.once();
      DataSnapshot snapshot = event.snapshot;
      Map<dynamic, dynamic>? approvedUsersData = snapshot.value as Map<dynamic, dynamic>?;

      if (approvedUsersData != null) {
        approvedUsersData.forEach((key, value) {
          if (value['VES_ID'] == enteredVESID &&
              value['Mobile-No'] == enteredMobileNo) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MyHomePage(userData: value),
              ),
            );

            // Navigator.of(context).pushReplacement(_createRoute(approvedUsersData));
            //

            // Navigator.of(context).pushReplacement(_createRoute());
            return;
          }
          else{
            // showInvalidCredentialsDialog(context);

          }
        });
      }
      else{
        showInvalidCredentialsDialog(context);

      }
    } catch (error) {
      print("Error fetching data: $error");
      showInvalidCredentialsDialog(context);
    }
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
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));

                // print('ok');
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }


  // Route _createRoute() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       const begin = Offset(0.0, 1.0);
  //       const end = Offset.zero;
  //       const curve = Curves.easeIn;
  //
  //       var tween = Tween(begin: begin, end: end).chain(
  //           CurveTween(curve: curve));
  //
  //       return SlideTransition(
  //         position: animation.drive(tween),
  //         child: child,
  //       );
  //     },
  //   );
  // }

  Route _createRoute(Map<dynamic, dynamic> userData) {
    return MaterialPageRoute(
      builder: (context) => MyHomePage(userData: userData),
    );
  }


}