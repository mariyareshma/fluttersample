import 'package:flutter/material.dart';

// create a material app widget 
class Medicalcare extends StatelessWidget {
const Medicalcare({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Medicalcare',
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}