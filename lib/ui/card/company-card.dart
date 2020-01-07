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
      width: 80,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
    );

    Widget upperRow = Row(       
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: <Widget>[
       Expanded(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Text(company.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.lightGreen)),    
             Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
             Text(company.creditRate, style: TextStyle(fontSize: 11))
           ],
         ),
       ),
       Expanded(
         child: Column(
           children: <Widget>[     
             Text(company.stocks, style: TextStyle(fontSize: 11), textAlign: TextAlign.end),
           ],
         ),
       ),
     ],
   );

   Widget bottomRow = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

    return new Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      elevation: 4,
      child: new InkWell(
        onTap: () => onTapped(context, company.urlLink, company.name),
        
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: Row(
            children: <Widget>[
                imageSection,
                Padding(padding: EdgeInsets.only(left: 5, right: 5)),
                Expanded(
                  child: Column(
                    children: <Widget>[    
                      upperRow,
                      Divider(color: Colors.black26),
                      bottomRow,
                    ],
                  ),
                ),
            ],
          ),  
        ),
      ),
    );
  }

  Future<Null> onTapped(context, url, name) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new WebViewPage(url, name))
    );
  }
  
}