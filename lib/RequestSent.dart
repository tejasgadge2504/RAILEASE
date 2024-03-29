import 'package:flutter/material.dart';


class RequestSent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(

            color: Colors.tealAccent,
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              'Request Sent Successfully',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          const SingleChildScrollView(

              child: Column(

                children: [

                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Please collect the HardCopy of the Concession Form From the Railway Concession Counter',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Thank you For using. See you Again',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('For any Queries Contact : railease@ves.ac.in',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                      ),
                    ],
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: Text('Feedback'),
                  // ),
                ],
              ),
            ),

        ],
      ),
    );
  }
}
