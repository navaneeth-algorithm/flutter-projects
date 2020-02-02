
import 'package:flutter/material.dart';

class DateTimeNow{

//Date in day-month-year format
//Time in hour:minute:seconds format

String getTodayDate() {
    var day = new DateTime.now().day;
    var month = new DateTime.now().month;
    var year = new DateTime.now().year;
    var todayDate =
        day.toString() + "-" + month.toString() + "-" + year.toString();
    return todayDate;
  }

  String getCurrentTime() {
    var currentTime = TimeOfDay.now();
    var hour = currentTime.hour;
    var minute = currentTime.minute;
    var seconds = DateTime.now().second;
    var timeInFormat =
        hour.toString() + ":" + minute.toString() + ":" + seconds.toString();
    return timeInFormat;
  }



}