import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee'),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

void changeDice()
{
  
}
class  _DicePageState extends State<DicePage>{
int leftdiceNumber = 1;
int rightdiceNumber = 1;
void rollDice()
{
    setState(() {
    leftdiceNumber = Random().nextInt(6)+1;
    rightdiceNumber = Random().nextInt(6)+1;
    });

}
@override
  Widget build(BuildContext context) {
    
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: (){
                
                  rollDice();
                
              },
              child: Image.asset('images/dice$leftdiceNumber.png'),
            ),
          ),
          Expanded(child: FlatButton(
            onPressed: (){
              
               rollDice();
              
            },
            child: Image.asset('images/dice$rightdiceNumber.png'),
          ),
          )
        ],
      ),
    );
  }
}
