import 'package:flutter/material.dart';

void main() => runApp(BookmarkHome());


class BookmarkHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade300
      ),
      home: SafeArea(
        child: Scaffold(
          body: BookmarkShare(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

}


class BookmarkShare extends StatefulWidget{

@override
BookmarkShareState createState() => BookmarkShareState();

}

class BookmarkDescription extends StatelessWidget{

  List<Shadow> shadowList = [
        Shadow(
            offset: Offset(3, 3),
            color: Colors.black38,
            blurRadius: 10),
        Shadow(
            offset: Offset(-3, -3),
            color: Colors.white.withOpacity(0.85),
            blurRadius: 10)
      ];
  Color colorText = Colors.grey.shade100;
  @override
  Widget build(BuildContext context) {
    
    return Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Space",style: TextStyle(color:colorText,shadows: shadowList),textAlign: TextAlign.left,),
          Text("Sorry Methane and organics",style: TextStyle(color:colorText,shadows: shadowList,fontSize: 20.0,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
          Text("Ethel Signal",style: TextStyle(color:colorText,shadows: shadowList),textAlign: TextAlign.left,),
          Text("15 Jun  7min Read",style: TextStyle(color:colorText,shadows: shadowList),textAlign: TextAlign.left,),
        ],
      ),
    );
  }

}

class BookmarkSnapShot extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   
    return Expanded(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.network("https://cdn.pixabay.com/photo/2020/01/16/15/09/landscape-4770871__340.jpg",height: 100.0,width: 100.0,),
          Icon(Icons.bookmark,color: Colors.black,size: 20.0,)
        ],
      ),
    );
  }

}

class BookmarkShareState extends State<BookmarkShare>{
  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        BookmarkWidget(),
        BookmarkWidget(),
        BookmarkWidget(),
        
      ],
    );
  }

}

class BookmarkWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            boxShadow: [BoxShadow(
              offset: Offset(20, 20),
              color: Colors.black38,
              blurRadius: 20
            ),
            BoxShadow(
            offset: Offset(-10, -10),
            color: Colors.white.withOpacity(0.85),
            blurRadius: 20)
            ],
            borderRadius: BorderRadius.circular(16.0),
          ),
        child: Row(
         
          children: <Widget>[
          BookmarkDescription(),
          BookmarkSnapShot()
          ],
        ),
      ),
    );
  }
}