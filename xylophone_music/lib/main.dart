import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
void main(){ 
  
  runApp(XylophoneMusic());

}


class XylophoneMusic extends StatelessWidget{

  void playNote(int note)
  {
    final player = AudioCache();
    player.play('note$note.wav');
  }

  Expanded buildKey({Color color,int noteNumber}) => Expanded(
      child: FlatButton(
          color: color,
          onPressed: (){
              playNote(noteNumber);
            },
            child:null,
          ),
      );

      
  
  @override
  Widget build(BuildContext context){
    
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
               buildKey(color:Colors.red,noteNumber:1),
               buildKey(color:Colors.green,noteNumber:2),
               buildKey(color:Colors.blueAccent,noteNumber:3),
               buildKey(color:Colors.deepOrange,noteNumber:4),
               buildKey(color:Colors.indigo,noteNumber:5),
               buildKey(color:Colors.lightGreen,noteNumber:6),
               buildKey(color:Colors.limeAccent,noteNumber:7),
            ],
          )
          ),
        ),
      );
  }


}
