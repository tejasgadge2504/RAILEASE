import 'package:flutter/material.dart';
import 'package:mine_app/LoginPage.dart';
import 'package:mine_app/myProfile.dart';

class SlideBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Tejas Gadge') ,
            accountEmail: Text('tejasgadge903@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child:
              Image.asset('assets/images/applogo1.png'),

              ),
            ),
          ),
          Container(

            height: 450,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,


              children: [


                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage(),));

                  },
                  child: Row(
                      children: [
                        IconButton(onPressed: (){
                          //an tap

                        },
                            icon: Icon(Icons.person)),

                        Text('  My Profile', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),

                      ]
                  ),
                ),

                Row(
                    children: [
                      IconButton(onPressed: (){
                        //an tap
                      },
                          icon: Icon(Icons.add_card_outlined)),
                      Text('  Application Status', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),

                    ]
                ),

                Row(
                    children: [
                      IconButton(onPressed: (){
                        //an tap
                      },
                          icon: Icon(Icons.settings)),
                      Text('  Settings', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),

                    ]
                ),

                Row(
                    children: [
                      IconButton(onPressed: (){
                        //an tap
                      },
                          icon: Icon(Icons.share)),
                      Text('  ShareApp', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                    ]
                ),


                Divider(height: 5,),

                Row(
                    children: [
                      IconButton(onPressed: (){
                        //an tap
                      },
                          icon: Icon(Icons.code_outlined)),
                      Text('  Developers', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),

                    ]
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));

                  },
                  child:Row(
                      children: [
                        IconButton(onPressed: (){
                          //an tap
                        },
                            icon: Icon(Icons.logout)),
                        Text('  Sign Out', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),

                      ]
                  ),
                )

              ],

            ),
          )

        ],
      ),
    );
  }
}