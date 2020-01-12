import 'package:flutter/material.dart';
import 'package:credits/ui/cards-list.dart';
import 'package:credits/helpers/geolacator.dart';

class HomePage extends StatefulWidget {
   HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndexPage = 0;

  CardsListPage cards;

  @override
  void initState() {
    super.initState();
    setLocation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndexPage = index;
    });
    cards = new CardsListPage(regionCode: index);
  }

  getLocation() async {
    return await getCurrentLocationByApi();
  }

  setLocation() async {
    final countryCode = await getLocation();

    REGIONS_CODES.forEach((k,v) => {
      if (v == countryCode) {
        setState(() {
          _currentIndexPage = k;
        }), 
        cards = new CardsListPage(regionCode: k),
      }
    });
    if(_currentIndexPage == 0) {
      setState(() {
        _currentIndexPage = 0; 
      });
      cards = new CardsListPage(regionCode: 0);
    }
    return countryCode;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9e9e9),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Оставьте заявки в 3-5 банках', style: TextStyle(color: Colors.white)),
        actions: <Widget>[],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffe3f9df),
        selectedItemColor: Color(0xff6fb165),
        selectedFontSize: 16,
        unselectedItemColor: Color(0xff303030),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        iconSize: 0,
        onTap: onTabTapped,
        currentIndex: _currentIndexPage,
        items: [
          BottomNavigationBarItem (
            title: Text('Россия'),
            icon: Icon(null),
          ),
           BottomNavigationBarItem (
            title: Text('Украина'),
            icon: Icon(null),
          ),
          BottomNavigationBarItem (
            title: Text('Казахстан'),
            icon: Icon(null),
          ),
        ],
      ),
      body: renderBody(), 
    );
  }

  Widget renderBody() {
    if(cards == null) {
      return new Center(child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff6fb165)),
      ));
    } else {
      return cards;
    }
  }
}