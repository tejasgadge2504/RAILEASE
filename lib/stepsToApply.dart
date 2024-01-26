import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mine_app/src/constants/colors.dart';


class MyStepsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tAppbar_color.shade200,
        title: Text('Steps To Apply', style: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        ),
        actions: [
          Row(
            children: [
              Text('Welcome User', style: TextStyle(color: Colors.white,),
              ),
              IconButton(onPressed: (){}, icon:Icon(Icons.person_2_rounded))
            ],
          )

        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: _buildSteps(),
      ),
    );
  }

  Widget _buildSteps() {
    return Container(
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStep("Step 1", "Sign up in the app."),
          _buildStep("Step 2", "Fill up the Name and other credentials accordingly in the APPLY FOR CONCESSION section."),
          _buildStep("Step 3", "After then upload the Required documents Correctly."),
          _buildStep("Step 4", "Uploading of the incorrect documents will be the reason for disapproval of the next steps."),
          _buildStep("Step 4", "Select your Address location as per your address on."),
        ],
      ),
    );
  }

  Widget _buildStep(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(description),
        SizedBox(height: 16.0),
      ],
    );
  }
}