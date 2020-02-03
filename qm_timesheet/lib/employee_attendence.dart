import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'constants.dart';
import 'attendance_entry_button.dart';

class EmployeeAttendence extends StatefulWidget {
  final String id;
  final String clientName;

  EmployeeAttendence({Key key, @required this.id, @required this.clientName})
      : super(key: key);
  @override
  _EmployeeAttendenceState createState() => _EmployeeAttendenceState();
}

class _EmployeeAttendenceState extends State<EmployeeAttendence> {
  String entryButtonText = '';
  

  Future<String> getEntryExitCount(int entry) async {
    var url = baseUrl + 'get.php';
    http.Response response = await http.post(url, body: {
      "entry": entry.toString(),
      "type": "Attendance",
      "employeeid": widget.id,
      "currentTime": dateTimeNow.getCurrentTime(),
      "currentDate": dateTimeNow.getTodayDate()
    });

    var data = json.decode(response.body);

    //print(data);
    return entry == 1 ? data[0]["InCount"] : data[0]["OutCount"];
  }

  Future<String> buttonTextCalculate() async{

     var inValue = await getEntryExitCount(1);
    //print(inValue);
    var outValue = await getEntryExitCount(2);
    //print(outValue);
    if (int.parse(inValue) == int.parse(outValue)) {

     return "IN";

      }
      else if (int.parse(inValue) > int.parse(outValue)) {

      return "OUT";
      
      }


      return null;

  }
 

  dynamic setAttendence(int entry) async {
    var url = baseUrl + 'set.php';
    http.Response response = await http.post(url, body: {
      "entry": entry.toString(),
      "type": "Attendance",
      "employeeid": widget.id,
      "currentTime": dateTimeNow.getCurrentTime(),
      "currentDate": dateTimeNow.getTodayDate()
    });

    var data = response.body;

    return data;
  }

   void calculateAttendence() async {
  
    if(this.entryButtonText=="IN"){
      setState(() {
        this.entryButtonText = "OUT";
      });
      
     await this.setAttendence(1);

     exit(0);
     
    }
    else if(this.entryButtonText=="OUT"){
      setState(() {
        this.entryButtonText = "IN";
      });
      
      await this.setAttendence(2);
      exit(0);
     
    }
  }

  dynamic initialButton() async{

    dynamic temp = await this.buttonTextCalculate();
    setState(() {
      this.entryButtonText = temp;
    });
    
  }

  @override
  void initState() {
    initialButton();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarName),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Logined by " + widget.clientName + " ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0),),
              AttendanceEntryButton(
                buttonText: this.entryButtonText,
                onPressed: () {
                  calculateAttendence();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
