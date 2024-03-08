import 'package:flutter/material.dart';
import 'package:mine_app/Mypage.dart';
import 'package:mine_app/SlideBar.dart';
import 'package:mine_app/Splash_Screen.dart';
import 'package:mine_app/RenewalPage.dart';
import 'package:mine_app/src/constants/colors.dart';
import 'package:mine_app/Registration.dart';
import 'e-history.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Permission.photos.request();
  await Permission.camera.request();
  runApp(MyApp());

}
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

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

class MyHomePage extends StatefulWidget {

  final Map<dynamic, dynamic> userData;

  MyHomePage({Key? key, required this.userData}) : super(key: key);


  // MyHomePage(this.userData);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // const MyHomePage({super.key, required this.title});
  final List_posts=['Steps to Apply','Apply for Consession','E-History','Application Status'];

  @override
  Widget build(BuildContext context) {
// Access VES_ID from widget.userData
    String vesId = widget.userData['Name'];


    var size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: SlideBar(userData: widget.userData,),
      appBar: AppBar(
        backgroundColor: tAppbar_color.shade200,
        title: Text('RAILEASE'),
        actions: [
          Row(

            children: [
              Text('Welcome \n ${widget.userData['VES_ID']}'),
              IconButton(onPressed: () {
                // print( Text('VES_ID: $vesId'),);
              }, icon: Icon(Icons.person_2_rounded))
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
              userData: widget.userData,
              child: List_posts[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>RenewalPage()),
                );
              },
            );
          }

          else if (List_posts[index] == 'Steps to Apply') {
            // Pass a callback function to handle navigation to Registration
            return Mypage(
              userData: widget.userData,

              child: List_posts[index],
              onTap: () {

              },
            );
          }

          else if (List_posts[index] == 'Application Status') {
            // Pass a callback function to handle navigation to Registration
            return Mypage(
              userData: widget.userData,

              child: List_posts[index],
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registration()),
                );

              },
            );
          } else if (List_posts[index] == 'E-History') {

            // Navigate to the TrainPassHistoryPage when 'E-History' is clicked
            return Mypage(
              userData: widget.userData,

              child: List_posts[index],
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TrainPassHistoryPage(userData: widget.userData,)),
                );
              },
            );
          }

          else {
            return Mypage(
              userData: widget.userData,

              child: List_posts[index],
              onTap: () {},
            );
          }
        },
      ),
    );
  }
}