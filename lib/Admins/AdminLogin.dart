import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mine_app/Admins/MainPage.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:mine_app/src/constants/strings.dart';

import 'Admin.dart';

class AdminLogin extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ValueNotifier<bool> passToggle = ValueNotifier<bool>(true);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passToggle.dispose();
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
                  Icon(Icons.admin_panel_settings_sharp, size: 65.0,),
                ],
              ),
              SizedBox(height: size.height * 0.02,),
              Text('LOGIN', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 65, color: tlogin_title_color),),
              Text('Please use accurate credentials', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
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
                        labelText: tEmail_Input, suffixStyle: TextStyle(fontWeight: FontWeight.w900),
                        hintText: tEmail_Input,
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)), borderSide: BorderSide(color: tButton_border)),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    ValueListenableBuilder<bool>(
                      valueListenable: passToggle,
                      builder: (context, isObscured, child) {
                        return TextFormField(
                          obscureText: isObscured,
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            labelText: tpasswd_Input,
                            suffixStyle: TextStyle(fontWeight: FontWeight.w900),
                            hintText: tpasswd_Input,
                            prefixStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)), borderSide: BorderSide(color: tButton_border)),
                            suffixIcon: IconButton(
                              icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
                              onPressed: () {
                                passToggle.value = !isObscured;
                              },
                            ),
                          ),
                        );
                      },
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
                    SizedBox(height: size.height * 0.1,),
                    SizedBox(
                      width: size.width * 0.5,
                      height: size.height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(_createRoute());
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

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MainPage(),
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
}
