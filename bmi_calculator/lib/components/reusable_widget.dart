import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  final Color colour;
  final Widget child;
  final Function onPress;
  ReusableWidget({@required this.colour,this.child,this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: onPress,
          child: Container(
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: colour,
            
          ),
          child: child,
        ),
    );
    
  }
}