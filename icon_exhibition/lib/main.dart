import 'dart:async';
import 'package:flutter/material.dart';
import 'icons_brain.dart';
import 'icons_display.dart';
import 'icon_controls.dart';

CollectedIcons collectedIcons = new CollectedIcons();
IconData iconviewdata = collectedIcons.startIcon();
IconData playToggle = Icons.play_arrow;
int iconPos = collectedIcons.currentPos();

void main() => runApp(IconInfo());

class IconInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: IconList(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class IconList extends StatefulWidget {
  @override
  _IconListState createState() => _IconListState();
}

class _IconListState extends State<IconList> {
  void currentIconPos() {
    iconPos = collectedIcons.currentPos();
  }

  void previousIcon() {
    setState(() {
      iconviewdata = collectedIcons.previousIcon();
      currentIconPos();
    });
  }

  void nextIcon() {
    setState(() {
      iconviewdata = collectedIcons.nextIcon();
      currentIconPos();
      //print(iconviewdata);
    });
  }

  void onLongPressPrevious() {}

  void onRestore() {
    setState(() {
      collectedIcons.shuffleIcons();
      iconPos = 0;
      collectedIcons.iconReset();
      iconviewdata = collectedIcons.startIcon();
    });
  }

  void onLongPressNext() {}

  void playPauseIcon() {
    setState(() {
      playToggle =
          playToggle == Icons.play_arrow ? (Icons.pause) : Icons.play_arrow;

      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          iconviewdata = collectedIcons.nextIcon();
          currentIconPos();
        });

        if (playToggle == Icons.play_arrow) {
          timer.cancel();
          //print("Pause");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 50.0,
        ),
        Expanded(
          flex: 3,
          child: IconView(
            iconPos: iconPos,
            iconViewData: iconviewdata,
            iconName: collectedIcons.getIconName(iconviewdata),
            onRestore: this.onRestore,
          ),
        ),
        Expanded(
          child: IconControl(
            previousIcon: this.previousIcon,
            playPauseIcon: this.playPauseIcon,
            nextIcon: this.nextIcon,
            playToggle: playToggle,
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}
