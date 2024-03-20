import 'package:flutter/material.dart';
import 'package:mine_app/welcome_Screen.dart';

class RegDone extends StatefulWidget {
  const RegDone({super.key});

  @override
  State<RegDone> createState() => _RegDoneState();
}

class _RegDoneState extends State<RegDone> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Done'),
        
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('assets/images/verify.png',
                  width: 150,
                  height: 150,
              ),
            ),
            SizedBox(height: size.height*0.05,),
            Text('Restration Done Successfully !!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: size.height*0.05,),
            ElevatedButton(onPressed: (){
               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Welcome_Screen()));
            },
                child: Text('Back to HOME Page',style: TextStyle(color: Colors.white),)
            )
          ],
        ),
      ),
      
    );
  }
}
