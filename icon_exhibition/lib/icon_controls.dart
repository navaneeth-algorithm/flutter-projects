import 'package:flutter/material.dart';

class IconControl extends StatelessWidget {
  final Function previousIcon;
  final Function nextIcon;
  final Function playPauseIcon;
  final IconData playToggle;

  IconControl(
      {this.previousIcon, this.nextIcon, this.playPauseIcon, this.playToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 40, 40, 40),
      color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconControlWidgets(
            iconData: Icons.fast_rewind,
            onPressed: this.previousIcon,
          ),
          IconControlWidgets(
            iconData: playToggle,
            onPressed: this.playPauseIcon,
          ),
          IconControlWidgets(
            iconData: Icons.fast_forward,
            onPressed: this.nextIcon,
          )
        ],
      ),
    );
  }
}

class IconControlWidgets extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;

  IconControlWidgets({this.onPressed, this.iconData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: this.onPressed, child: Icon(this.iconData));
  }
}
