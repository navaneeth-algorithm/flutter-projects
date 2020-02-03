import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:qm_timesheet/employee_attendence.dart';
import 'constants.dart';

void main() => runApp(QMTimeSheet());

class QMTimeSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(appBarName),
          centerTitle: true,
        ),
        body: SafeArea(
          child: LoginModule(),
        ),
      ),
      debugShowCheckedModeBanner: false,
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
  
  


  void  _login(String phonenumber,String password) async{

    var url = baseUrl+'get.php';
    http.Response response = await http.post(url, body:{
      "type":"Employee",
      "phonenumber": phonenumber,
      "password": password,
    });
    print(response.body);
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


  Future _scan() async {
    String barcode = await scanner.scan();
    List userInfo = barcode.split(';');
    //print(userInfo[0]);
   // print(userInfo[1]);
   if(userInfo.length!=0)
    _login(userInfo[0],userInfo[1]);
    else{
      this.msg="Some Error Occured";
    }
    
  }


   @override
  void initState() {
    _scan();
    super.initState();
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
            RaisedButton(onPressed: (){
              _scan();
              },
            child: Text("Scan"),
            ),
            Text(msg,style: TextStyle(color: Colors.red),)
          ],
        ),
      ),
    );
  }
}


