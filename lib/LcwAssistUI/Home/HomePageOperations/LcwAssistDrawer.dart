import 'package:flutter/material.dart';

import 'package:lcwassist/Core/BaseConst/LcwAssistPageDrawerNumberConst.dart';
import 'package:lcwassist/LcwAssistUI/Home/HomePageOperations/HomePage.dart';
import 'package:lcwassist/LcwAssistUI/SalesOperations/ProductSalesPerformanceOperations/ProductPerformansQueryPage.dart';
import 'package:lcwassist/Style/LcwAssistColor.dart';
import 'package:lcwassist/Style/LcwAssistTextStyle.dart';


class DrawerItem {
  String title;
  int drawerItemNumber;
  IconData icon;
  DrawerItem(this.title,this.drawerItemNumber, this.icon);
}



class DrawerOnly {
  
static Widget leftSideMenuDiz(int currentPage,BuildContext context) {

  final drawerItems = [
    new DrawerItem("AnaSayfa",0, Icons.home),
    new DrawerItem("Kapasite",1, Icons.table_chart),//domain
    new DrawerItem("Satış",2, Icons.payment),
    new DrawerItem("Mağaza Karne",3, Icons.store),
    new DrawerItem("Mağaza Seç",4, Icons.location_on),
    new DrawerItem("Ayarlar",5, Icons.settings)
  ];

sayfaAc(int sayfaNumber){

//Navigator.of(context).pop();

if(sayfaNumber == LcwAssistPageDrawerNumberConst.anaSayfa)
{
  var route = new MaterialPageRoute(
              builder: (BuildContext context) => HomePage()
            );
     Navigator.of(context).push(route);
}
if(sayfaNumber == LcwAssistPageDrawerNumberConst.satis-1)
{
  var route = new MaterialPageRoute(
              builder: (BuildContext context) => ProductPerformansQueryPage()
            );
     Navigator.of(context).push(route);
}

}


    List<Widget> drawerOptions = [];
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(
Container(

 // padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0,10.0),
      decoration:  BoxDecoration(
         border:  Border(
      top:  BorderSide(width: 0.0, color:  LcwAssistColor.secondaryColor),
      left:  BorderSide(width: 6.0, color:  i == currentPage ? LcwAssistColor.selectedColor : LcwAssistColor.secondaryColor),
      right:  BorderSide(width: 0.0, color:  LcwAssistColor.secondaryColor),
      bottom:  BorderSide(width: 0.0, color:  LcwAssistColor.secondaryColor)//Color.fromRGBO(182,0,62, 1.0))
    )),
    child: 
  new ListTile(
          leading: new Icon(d.icon,color: Colors.white,),
          title: new Text(d.title,style: TextStyle(color: Colors.white,fontSize: 20.0,fontFamily: LcwAssistTextStyle.currentTextFontFamily),),
          onTap: () =>             
            sayfaAc(drawerItems[i].drawerItemNumber)//_onSelectItem(i), i numarası benim için hangi ekranı açacağımın işaretidir.
        )

      ));
    }


    return  Drawer(
        child: Container(
          color:LcwAssistColor.secondaryColor,
          child:
         new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Burak BİTKİN",style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily)),
                accountEmail: new Text('Yazılım Geliştirme Uzmanı',style: TextStyle(fontFamily: LcwAssistTextStyle.currentTextFontFamily),),
                currentAccountPicture: new GestureDetector(
    child: new CircleAvatar(
      backgroundImage: AssetImage('assets/defaultMalePP.png'),
      backgroundColor: LcwAssistColor.primaryColor,//NetworkImage('https://badhan.org/img/avatars/defaultMalePP.png'),
    ),
  ),
  decoration: new BoxDecoration(
    color: LcwAssistColor.primaryColor
  )
                ),
            new Column(children: drawerOptions)
          ],
        ),)
      );
  }
}