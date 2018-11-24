import 'package:flutter/material.dart';
class LcwAssistLoading_{

void showAlert(BuildContext context){

AlertDialog dialog = new AlertDialog(

content: new Text('asdasdas',

style: new TextStyle(fontSize: 30.0),),

actions: <Widget>[Text('Yükleniyor...')],

);

showDialog(context: context, child: loadingBar());

}


Widget loadingBar(){

return

new Material(

type: MaterialType.transparency,

child: Center(child: Container(

height: 100.0,width: 150.0,

decoration: new BoxDecoration(

//color: Colors.black.withOpacity(0.1),

color: Colors.black.withOpacity(0.7),

// image: new DecorationImage(

// image: new ExactAssetImage('assets/dougn_88.png'),

// fit: BoxFit.cover,

// ),

// border: new Border.all(

// color: Colors.black,

// width: 0.0,

// ),

borderRadius: BorderRadius.all(Radius.circular(5.0)),

),

child: Column(

children: <Widget>[

Padding(padding: EdgeInsets.all(8.0)),

new CircularProgressIndicator(), //Image.asset('assets/loading12.gif'),

Padding(padding: EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 0.0)),

new Text('Yükleniyor...',style: TextStyle(fontSize: 16.0,color: Colors.white)),

],

),))

);}

}