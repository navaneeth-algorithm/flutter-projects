import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Center(child: Text('I am rich')
      ,),
      backgroundColor: Colors.black87,
    ),
    body: Center(child: Image(
      image: AssetImage('images/diamond.png'),
    ),
   ),
    backgroundColor: Colors.grey[400],
),
),
);}


