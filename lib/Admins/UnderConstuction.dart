import 'package:flutter/material.dart';

class UnderConstruction extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("This page is UnderConstruction",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),

                SizedBox(),

                Image.asset('images/Under_Construction.png'),

                Text('Sorry for inconvinence',style: TextStyle(fontSize: 20),),
              ],
            ),
          )),
      ),
    );
  }
}