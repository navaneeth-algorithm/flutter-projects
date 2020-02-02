import 'package:flutter/material.dart';


class AttendanceEntryButton extends StatelessWidget {
  
  final Function onPressed;
  final String buttonText;

  AttendanceEntryButton({this.onPressed,this.buttonText});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed:this.onPressed,
      child: Text(this.buttonText),
    );
  }
}
