import 'package:flutter/material.dart';

class RoundCircularButton extends StatelessWidget {
  final IconData icon;
  final Function onpress;

  RoundCircularButton({@required this.icon,@required this.onpress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      onPressed: onpress,
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}