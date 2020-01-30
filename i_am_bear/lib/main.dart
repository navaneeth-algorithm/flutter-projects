import 'package:flutter/material.dart';

void main() { runApp(
  MaterialApp(home: Scaffold(
    appBar: AppBar(
      title: Center(child: Text('Poo Bear'),
      
      ),
      backgroundColor:Colors.deepPurple[200],
      
    ),
    body: Center(
      child: Image(
        image: AssetImage('images/iamgood.gif'),
      ),
    ),
    backgroundColor: Colors.white,
  ),
  ));
}