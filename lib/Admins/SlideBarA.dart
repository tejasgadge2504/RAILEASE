import 'package:flutter/material.dart';
import 'package:mine_app/Admins/AdminLogin.dart';
import 'package:mine_app/Admins/AdminProfile.dart';
import 'package:mine_app/Admins/MainPage.dart';
import 'package:mine_app/LoginPage.dart';
import 'package:mine_app/src/constants/images.dart';

class SlideBarA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Tejas Gadge'),
            accountEmail: Text('tejasgadge903@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(applogo),
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
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AdminProfilePage()),
                    );
                  },
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // onTap
                        },
                        icon: Icon(Icons.person),
                      ),
                      Text('Profile', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // onTap
                      },
                      icon: Icon(Icons.add_card_outlined),
                    ),
                    Text('Data Management', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // onTap
                      },
                      icon: Icon(Icons.feedback),
                    ),
                    Text('Feedback & Support', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // onTap
                      },
                      icon: Icon(Icons.settings),
                    ),
                    Text('Settings', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,),
                    ),
                  ],
                ),

                Divider(height: 5),

                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // onTap
                      },
                      icon: Icon(Icons.live_help),
                    ),
                    Text('Help', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AdminLogin()),
                    );
                  },
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // onTap
                        },
                        icon: Icon(Icons.logout),
                      ),
                      Text('sign Out', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,),
                      ),
                    ],
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
