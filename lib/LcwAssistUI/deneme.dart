import 'package:flutter/material.dart';

class Deneme extends StatefulWidget {
  @override
  _DenemeState createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Row(children: <Widget>[Text('data'),Icon(Icons.ac_unit)],),),
     body: Column(children: <Widget>[Text('data'),RaisedButton(color: Colors.blueGrey,child: Text('data'),onPressed: (){},)],),
     drawer: Drawer(child: Column(children: <Widget>[Container(color: Colors.blueGrey,)],),),

    );
  }
}