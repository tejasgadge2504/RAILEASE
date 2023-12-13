import 'package:flutter/material.dart';
import 'package:mine_app/Mypage.dart';
import 'package:mine_app/SlideBar.dart';
import 'package:mine_app/Splash_Screen.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:mine_app/Registration.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      // title: 'home page',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: tAppbar_color.shade100),
        useMaterial3: false,
      ),
      home: Splash_Screen(),

    );
  }
}

class MyHomePage extends StatelessWidget {
  // const MyHomePage({super.key, required this.title});


  // final String title;

  final List_posts=['Steps to Apply','Apply for Consession','E-History','Application Status'];

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: SlideBar(),
      appBar: AppBar(
        backgroundColor: tAppbar_color.shade200,
          title: Text('RAILEASE'),

        actions: [
          Row(
            children: [
              Text('Welcome User'),
              IconButton(onPressed: (){}, icon:Icon(Icons.person_2_rounded))
            ],
          )

        ],

      ),
      body: ListView.builder(
        itemCount: List_posts.length,
        itemBuilder: (context, index) {
          if (List_posts[index] == 'Apply for Concession') {
            // Pass a callback function to handle navigation to Registration
            return Mypage(
              child: List_posts[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registration()),
                );
              },
            );
          } else {
            return Mypage(
              child: List_posts[index],
              onTap: () {},
            );
          }
        },
      ),
    );
  }
}