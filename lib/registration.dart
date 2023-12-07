import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import  'package:flutter/src/material/stepper.dart';

class registration extends StatelessWidget {
  List<Step>stepList()=>[
    const Step(title: const Text('Info'), content: Center(
      child: Text("Info"),
    )), const Step(title: const Text('Docs'), content: Center(
      child: Text("Docs"),
    )), const Step(title: const Text('Confirm'), content: Center(
      child: Text("Confirm"),
    )),
  ];

  int _activeStepIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: () {
          if (_activeStepIndex < stepList().length - 1) {
            _activeStepIndex += 1;
          }
          setState(){
            
          }
        },
      )
    );
  }
}
