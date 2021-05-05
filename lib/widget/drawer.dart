import 'package:flutter/material.dart';

class HomeMenuDrawer extends StatefulWidget {
  HomeMenuDrawer({Key key}) : super(key: key);

  _HomeMenuDrawerState createState() => _HomeMenuDrawerState();
}

class _HomeMenuDrawerState extends State<HomeMenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.black),
          accountName: Text("Vicky Kumar"),
          accountEmail: Row(
            children: <Widget>[
              Text("5.0"),
              Icon(
                Icons.star,
                color: Colors.white,
                size: 12,
              )
            ],
          ),
          currentAccountPicture: CircleAvatar(
            radius: 60.0,
            backgroundColor: const Color(0xFF778899),
            child: ClipOval(
              child: Image.asset(
                "assets/images/men_img.JPG",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          linkMenuDrawer('Wallet', () {
            Navigator.pushNamed(context, '/payment');
          }),
          linkMenuDrawer('Your Trips', () {
            Navigator.pushNamed(context, '/your_trip');
          }),
          linkMenuDrawer('Help', () {
            Navigator.pushNamed(context, '/help');
          }),
          linkMenuDrawer('Settings', () {
            Navigator.pushNamed(context, '/settings');
          }),
        ]),
      ],
    );
  }
}

Widget linkMenuDrawer(String title, Function onPressed) {
  return InkWell(
    onTap: onPressed,
    splashColor: Colors.black,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      width: double.infinity,
      child: Text(
        title,
        style: TextStyle(fontSize: 15.0),
      ),
    ),
  );
}
