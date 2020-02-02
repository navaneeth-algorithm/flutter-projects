import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'inputfield_widget.dart';
import 'package:qm_timesheet/employee_attendence.dart';
import 'constants.dart';

void main() => runApp(QMTimeSheet());

class QMTimeSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("QM Time Sheet"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: LoginModule(),
        ),
      ),
    );
  }
}

class LoginModule extends StatefulWidget {
  @override
  _LoginModuleState createState() => _LoginModuleState();
}

class _LoginModuleState extends State<LoginModule> {


  TextEditingController phone = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  String msg ='';
  String id = '';
  String employeeName = '';

  Future<List> _login() async{

    var url = baseUrl+'get.php';
    String phonenumber = phone.text;
    String password = pass.text;
    http.Response response = await http.post(url, body:{
      "type":"Employee",
      "phonenumber": phonenumber,
      "password": password,
    });
    var dataUser = json.decode(response.body);
    if (dataUser.length==0){
      
      setState(() {
        msg='Login Failed';
      });

    } else{
      msg='';
     /* Navigator.pushReplacementNamed(context, '/uploadPage');*/
      id = dataUser[0]['Id'].toString();
      employeeName = dataUser[0]['Name'];
    
     Navigator.push(
        context,
         new MaterialPageRoute(builder: (context) => new EmployeeAttendence(id: id, clientName: employeeName)),
      
     );
    
    }

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blue.shade100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InputFieldWidget(
              inputFieldIcon: Icon(Icons.phone),
              hintText: "Enter your Phone Number",
              controller: phone,
              texttype: TextInputType.phone,
              encodeCharacter: false,
            ),
            InputFieldWidget(
              inputFieldIcon: Icon(Icons.lock),
              hintText: "Enter Password",
              controller: pass,
              encodeCharacter: true,
            ),
            RaisedButton(
              child: Text(
                "Login",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                _login();
              },
              color: Colors.blueAccent[100],
            ),
            Text(msg,style: TextStyle(color: Colors.red),)
          ],
        ),
      ),
    );
  }
}


