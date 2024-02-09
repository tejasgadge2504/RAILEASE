import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mine_app/Admins/AdminLogin.dart';
import 'package:mine_app/LoginPage.dart';
import 'package:mine_app/Registration.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:mine_app/src/constants/images.dart';

class Welcome_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image Container
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/vesitcampus.jpg"), // Replace with your image asset path
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Optional: Add blur effect to the background
              child: Container(color: Colors.black.withOpacity(0.2)),
            ),
          ),

          // Main Column
          Container(
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Image.asset('assets/images/applogo1.png', height: height * 0.2),
                ),
                Text(
                  'RAILEASE',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.white),
                ),
                Text(
                  'Railway Concession Automation at VESIT',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.white),
                ),
                SizedBox(height: height * 0.05),
                Text(
                  'WELCOME',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500,color: Colors.white),
                ),
                Text(
                  'Student',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400,color: Colors.white),
                ),
                SizedBox(height: height*0.08),
                Text(
                  'Please Kindly Login or SignUp on the App',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: (height * 0.06)-9),
                Row(
                  children: [
                    SizedBox(width: width * 0.1),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(_createRoute());
                        },
                        child: Text('LOGIN'),
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: tAppbar_color),
                          padding: EdgeInsets.symmetric(vertical: 25),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.05),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(_regRoute());
                        },
                        child: Text('New User?\nRegister Here'),
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: tAppbar_color),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.1),
                  ],
                ),

                SizedBox(height: (height * 0.03)-9),
                Text('OR',style: TextStyle(color: Colors.white),),

                SizedBox(height: (height * 0.03)-9),
                SizedBox(
                  width: width * 0.5,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(_adminRoute());
                    },
                    child: Text(
                      'ADMIN\'s Corner',
                      style: TextStyle(),
                    ),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: tAppbar_color),
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  LoginPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _regRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  Registration(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


Route _adminRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AdminLogin(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
// ... (rest of your code)
