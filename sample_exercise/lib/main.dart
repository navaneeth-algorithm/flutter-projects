import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Sample());
}

class Sample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: SampleChange(),
    );
  }
}

class SampleChange extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: AppContainer(),
      ),
    );

}}

class PressCount extends StatefulWidget{

@override 
PressCountState createState()=> PressCountState();
  
}

class PressCountState extends State<PressCount>{
  int _countNumber=0;

  void changeCount(){
          setState(() {
                
                _countNumber++;
                print(_countNumber);
              });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
            color: Colors.lightBlue.shade100,
            child: FlatButton(
            onPressed: ()=>changeCount(),
            child: Text("PRESS ME $_countNumber"),
          ),
        );
  }

}
class AppContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(child:AppItems()),
        Expanded(child:AppItems()),
        Expanded(child:AppItems()),
        PressCount(),
      ],
    );
  }

}


class AppItems extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.explore,size:45.0,color: Colors.red,),
          Icon(Icons.fast_forward,size: 45.0,color: Colors.blue,),
          Icon(Icons.fast_rewind,size:45.0,color: Colors.green,),
        ],
      ),
      color: Colors.indigo.shade50,
    );
  }

}