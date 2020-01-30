import 'package:flutter/material.dart';
import 'dart:math';
void main() { runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Magic Ball',
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              letterSpacing: 5.0,
              fontSize: 28.0
            ),),
            ),
            backgroundColor: Colors.amberAccent,
          ),
          body: MagicBall(),
        ),
      ),
    );
}

class MagicBall extends StatefulWidget{
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall>{
int ballStateNumber = 1;

void answerBall(){

  setState(() {
    ballStateNumber = Random().nextInt(5)+1;
  });
}
@override
Widget build(BuildContext context){
  return Center(
    child: Row(children: <Widget>[
      Expanded(
        child: FlatButton(
          onPressed: (){
            answerBall();
          },
          child: Image.asset('images/ball$ballStateNumber.png'),
        ),
      )
    ],),
  );
}
}