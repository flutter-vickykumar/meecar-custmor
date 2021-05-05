import 'package:flutter/material.dart';
import 'package:meecar/widget/HelpPage.dart';
import 'package:meecar/widget/Homepage.dart';
import 'package:meecar/widget/Payementpage.dart';
import 'package:meecar/widget/choosecar.dart';
import 'package:meecar/widget/map.dart';
import 'package:meecar/widget/search.dart';
import 'package:meecar/widget/settingPage.dart';
import 'package:meecar/widget/your_trip.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: './',
      routes: {
        '/myhomepage': (context) => MyHomePage(),
        '/searchbar': (context) => SearchBar(),
        '/payment': (context) => PaymentPage(),
        // '/add_payment': (context) => AddPaymentMethodPage(),
        // '/add_card': (context) => AddCardPage(),
        '/your_trip': (context) => YourTripPage(),
        // '/select_issue': (context) => SelectIssuePage(),
        // '/free_rides': (context) => FreeRidesPage(),
        '/help': (context) => HelpPage(),
        '/settings': (context) => SettingsPage(),
        '/ChooseCar': (context) => ChooseCar(),
      },
      // home: MyHomePage(title: 'meecar'),
      home: Home(),
    );
  }
}
