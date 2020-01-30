import 'package:flutter/material.dart';
import '../constants.dart';


class Icon_Items extends StatelessWidget {
  
  final IconData iconData;
  final String textName;
  Icon_Items({this.iconData,this.textName});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconData,size: 80,),
        SizedBox(height: 15.0,),
        Text(textName,style:kLabelTextStyle,),
      ],
    );
  }
}