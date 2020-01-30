import 'package:flutter/material.dart';
import 'icon_controls.dart';
class IconView extends StatelessWidget {
  final int iconPos;
  final IconData iconViewData;
  final String iconName;
  final Function onRestore;

  IconView({this.iconPos, this.iconViewData,this.iconName,this.onRestore});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40.0),
      padding: EdgeInsets.all(20.0),
      color: Colors.amber,
      child: Column(
        children: <Widget>[
          Container(
            width: 50,
            alignment: Alignment.topLeft,
           
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(20)),
            child: Text(
              this.iconPos.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Icon(
                  this.iconViewData,
                  size: 100,
                ),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconControlWidgets(iconData: Icons.restore,onPressed: this.onRestore,),
                  Text(this.iconName)
                ],
              )
              ,
        ],
      ),
    );
  }
}
