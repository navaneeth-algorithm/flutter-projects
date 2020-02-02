import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'constants.dart';
import 'DateTimeNow.dart';
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
  DateTimeNow dateTimeNow = new DateTimeNow();

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

  void calculateAttendence() async {
    var inValue = await getEntryExitCount(1);
    print(inValue);
    var outValue = await getEntryExitCount(2);
    print(outValue);

    if (int.parse(inValue) == int.parse(outValue)) {
      setState(() {
        this.entryButtonText = "IN";
      });

      this.setAttendence(1);
    } else if (int.parse(inValue) > int.parse(outValue)) {
      setState(() {
        this.entryButtonText = "OUT";
      });

      this.setAttendence(2);
    }
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

  @override
  void initState() {
    calculateAttendence();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QM Time Sheet"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Logined by " + widget.clientName + " "),
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
