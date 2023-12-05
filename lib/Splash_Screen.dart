import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mine_app/main.dart';
import 'package:mine_app/src/constants/images.dart';
import 'package:mine_app/welcome_Screen.dart';


class Splash_Screen extends StatefulWidget{
  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    super.initState();


    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welcome_Screen(),),
      );

    });

  }


  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,

        child: Padding(
          padding: const EdgeInsets.only(left: 0.0,right: 0.0,top: 5.0,bottom: 5.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200,),
                Center(
                  child: Container(
                      height:150,
                      width: 150,


                      decoration: BoxDecoration(
                        color:  Colors.transparent,
                        borderRadius: BorderRadius.circular(75.5),
                      ),

                      child: Image.asset(applogo,height: size.height*0.2 ,),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('RAILEASE',style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),
              ),
                SizedBox(height: 170,),
                Text('by'),
                SizedBox(height: 3,),
                Text('Team INSPIRE',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.redAccent))
              ],
            ),
          ),
        ),



      ),
    );
  }
}


// Image.asset('assets/images.dart/applogo.jpg'),
// Text('RAILEASE',style: TextStyle(fontSize: 36),)),