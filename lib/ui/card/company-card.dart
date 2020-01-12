import 'package:flutter/material.dart';
import 'dart:async';
import 'package:credits/ui/web-view.dart';
import 'package:credits/models/company.dart';

class CompanyCard extends StatelessWidget {

  final Company company;

  CompanyCard(this.company);

  @override
  Widget build(BuildContext context) {

    Widget imageSection = Container(
      child: Image.asset(company.imgUrl, scale: 1, alignment: Alignment.center),
      height: 80,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
    );

    Widget upperRow = Row(       
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: <Widget>[
       Expanded(
         child: Column(
           children: <Widget>[     
             Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              color: Color(0xffe3f9df),
              child: Text('Процентная ставка - ${company.creditRate}', style: TextStyle(fontSize: 12), textAlign: TextAlign.end),
             ),
           ],
         ),
       ),
     ],
   );

   Widget bottomRow = Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Column(
        children: <Widget>[
          Text('Сумма', style: TextStyle(fontSize: 12)),
          Padding(padding: EdgeInsets.only(top: 2)),
          Text(company.amount, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))
        ],
      ),
      Column(
        children: <Widget>[
          Text('Срок', style: TextStyle(fontSize: 12)),
          Padding(padding: EdgeInsets.only(top: 2)),
          Text(company.time, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))
        ],
      ),
      Column(
        children: <Widget>[
          Text('Возраст', style: TextStyle(fontSize: 12)),
          Padding(padding: EdgeInsets.only(top: 2)),
          Text(company.age, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),                                                            
        ],
      )
    ],
  );

  Widget actions = Container(
    padding: EdgeInsets.symmetric(vertical: 5),
    width: 180,
    child: Center(
      child: FlatButton(
        color: Color(0xff6fb165),
        textColor: Color(0xffffffff),
        child: Text('Получить займ'),
        padding: EdgeInsets.symmetric(horizontal: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        onPressed: () => onTapped(context, company.urlLink),
      ),
    )
  );

    return new Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      elevation: 4,
      child: new InkWell(
        onTap: () => onTapped(context, company.urlLink),
        
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Column(
            children: <Widget>[
              imageSection,
              Padding(padding: EdgeInsets.only(left: 5, right: 5)),
              upperRow,
              Divider(color: Colors.black26),
              Padding(
                child: bottomRow,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              ),
              actions
            ],
          ),  
        ),
      ),
    );
  }

  Future<Null> onTapped(context, url) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new WebViewPage(url))
    );
  }
  
}