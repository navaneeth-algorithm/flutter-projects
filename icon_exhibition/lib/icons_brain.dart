import 'package:flutter/material.dart';
import 'icons_data.dart';
class CollectedIcons {

static IconsData _iconData = new IconsData();

int _iconPos =0;
List <IconData> _icon_list = _iconData.getlistIconData();
Map <IconData,String> _icon_dict = _iconData.getdictIconData();

void shuffleIcons(){

  this._icon_list.shuffle();
}

String getIconName(IconData iconData){
  return this._icon_dict[iconData];
}

IconData getIcon(int pos){

  shuffleIcons();
  pos = pos<0||pos>this.totalIcons()?0:pos;
  return this._icon_list[pos];
}

int currentPos(){
  return this._iconPos;
}

IconData nextIcon(){
  this._iconPos = this._iconPos>=this.totalIcons()-1?0:this._iconPos+1;
  //print(this._iconPos);
  return this._icon_list[this._iconPos];
}

IconData previousIcon(){
  this._iconPos = this._iconPos<=0?0:this._iconPos-1;
  return this._icon_list[this._iconPos];
}

void iconReset(){

  this._iconPos=0;
}

IconData startIcon(){

  return this._icon_list[0];
}

int totalIcons(){
  return this._icon_list.length;
}

}