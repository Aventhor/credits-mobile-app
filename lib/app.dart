import 'package:flutter/material.dart';
import 'package:credits/ui/home.dart';

class MyCreditsApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Оставьте заявки в 3-5 банках',
      initialRoute: '/',
      theme: _creditsTheme,
      routes: <String, WidgetBuilder> {
        '/': (context) => HomePage(),
      },
    );
  }
}

final ThemeData _creditsTheme = _buildCreditsTheme();

ThemeData _buildCreditsTheme() {

  final ThemeData base = ThemeData.light();

  return base.copyWith(
      primaryColor: Color(0xff6fb165),
      accentColor: Color(0xffe3f9df),
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: Color(0xff6fb165),
        textTheme: ButtonTextTheme.normal,
        minWidth: 280.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
      hintColor: Colors.grey[100],
      scaffoldBackgroundColor: Colors.white,
      
      textSelectionColor: Colors.yellow,
      errorColor: Colors.red,
      textTheme: _buildCreditsTextTheme(base.textTheme),
      primaryTextTheme: _buildCreditsTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildCreditsTextTheme(base.accentTextTheme),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        filled: true,
      ));
}

TextTheme _buildCreditsTextTheme(TextTheme base) {
  return base
      .copyWith(
        display1: base.display1.copyWith(
          fontSize: 18.0,
        ),
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        subtitle: base.subtitle.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        displayColor: Colors.black,
        bodyColor: Colors.black,
      );
}


