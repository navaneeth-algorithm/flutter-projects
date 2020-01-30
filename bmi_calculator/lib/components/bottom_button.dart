import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
 final buttonText;
 final onPressed;

 BottomButton({this.buttonText,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.onPressed,
        child: Container(
        alignment: Alignment.center,
        child: Text(this.buttonText,style: kLargeButtonStyle,),
        color: kButtomButtonColor,
        margin: EdgeInsets.only(top: 15),
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 15.0),
        height: kBottomContainerHeight,
      ),
    );
  }
}