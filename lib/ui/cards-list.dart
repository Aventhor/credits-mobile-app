import 'package:credits/models/company.dart';
import 'package:flutter/material.dart';
import 'package:credits/ui/card/company-card.dart';
import 'package:credits/data.dart';
import 'package:credits/helpers/geolacator.dart';
import 'dart:async';

class CardsListPage extends StatefulWidget {
  final int regionCode;
  CardsListPage({Key key, this.regionCode}) : super(key: key);

  @override
  _CardsListPageState createState() => new _CardsListPageState();
}

class _CardsListPageState extends State<CardsListPage> {

  List <Company> companies;
  int regionCode;
  
  @override
  void initState() {
    super.initState();
    
    setRegion(widget.regionCode);
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    setRegion(widget.regionCode);
  }

  setRegion(int regionCode) async {
    companies = null;
    regions.forEach((k,v) => {
      if(k == regionCode) {
        companies = v,
      }
    });
    return companies;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffe9e9e9),
      child: Column(
        children: <Widget>[
          Expanded(
            child: new FutureBuilder(
              future: setRegion(widget.regionCode),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting: return new Center(child: CircularProgressIndicator()); 
                  default: 
                    if(snapshot.hasError) {
                      return Center(child: Text('Error on fetching data. Try again'));        
                  }
                }
                if(companies == null) {
                  return Center(child: Text("Sorry, we don't have any data", style: TextStyle(fontWeight: FontWeight.w500)));
                } else {
                  return ListView.builder(
                    itemBuilder: (context, index) => new CompanyCard(companies[index]),
                    itemCount: companies.length,
                  );            
                }
              },       
            ),
          ),
          // Expanded(
          //   child: FutureBuilder(
          //     future: getLocation(),
          //     builder: (BuildContext context, AsyncSnapshot snapshot) {
          //       if(snapshot.hasData) {
          //         return AlertDialog(
          //           title: Text('Location'),
          //           content: Text(snapshot.data),
          //           actions: <Widget>[
          //             FlatButton(
          //               child: Text('Close'),
          //               onPressed: () { },
          //             ),
          //           ],
          //         );
          //       }
          //     },
          //   ),
          // )
        ],
      ),
    );
  }

}