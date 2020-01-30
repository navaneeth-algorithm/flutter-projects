import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('images/navaneeth.jpg'),
                  radius: 50.0,
                ),
                Text(
                  'Navaneeth B',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Full Stack Developer',
                  style: TextStyle(
                      color: Colors.teal.shade100,
                      fontSize: 20.0,
                      fontFamily: 'Source Sans Pro',
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.tealAccent,
                    ),
                    title: Text('+91 9481019888',
                        style: TextStyle(
                            color: Colors.teal.shade900, fontSize: 15.0)),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.tealAccent,
                    ),
                    title: Text('navaneethb807@gmail.com',
                        style: TextStyle(
                            color: Colors.teal.shade900, fontSize: 15.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
