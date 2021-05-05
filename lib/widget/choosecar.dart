import 'dart:async';
import 'package:floating_pullup_card/floating_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChooseCar extends StatefulWidget {
  ChooseCar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChooseCarState createState() => _ChooseCarState();
}

class _ChooseCarState extends State<ChooseCar> {
  // GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _myLocation = CameraPosition(
    target: LatLng(0, 0),
  );

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 150.0),
            child: FloatingPullUpCardLayout(
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text("Choose a ride or Swipe up for more"),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/men_img.JPG",
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text("UberGo"),
                                  Text("4:28pm dropff "),
                                ],
                              ),
                              Spacer(),
                              Text("\$67.00")
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/men_img.JPG",
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text("UberGo"),
                                  Text("4:28pm dropff "),
                                ],
                              ),
                              Spacer(),
                              Text("\$67.00")
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/men_img.JPG",
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text("UberGo"),
                                  Text("4:28pm dropff "),
                                ],
                              ),
                              Spacer(),
                              Text("\$67.00")
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/men_img.JPG",
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text("UberGo"),
                                  Text("4:28pm dropff "),
                                ],
                              ),
                              Spacer(),
                              Text("\$67.00")
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/men_img.JPG",
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text("UberGo"),
                                  Text("4:28pm dropff "),
                                ],
                              ),
                              Spacer(),
                              Text("\$67.00")
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/men_img.JPG",
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text("UberGo"),
                                  Text("4:28pm dropff "),
                                ],
                              ),
                              Spacer(),
                              Text("\$67.00")
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/men_img.JPG",
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text("UberGo"),
                                  Text("4:28pm dropff "),
                                ],
                              ),
                              Spacer(),
                              Text("\$67.00")
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/men_img.JPG",
                                height: 50,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text("UberGo"),
                                  Text("4:28pm dropff "),
                                ],
                              ),
                              Spacer(),
                              Text("\$67.00")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                child: Container(
                  child: GoogleMap(
                    initialCameraPosition: _myLocation,
                    mapType: MapType.normal,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                )),
          ),
          Positioned(
            left: 3,
            top: 3,
            right: 0,
            child: Column(
              children: <Widget>[
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Card(
                      child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 8, right: 8),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/payment");
                          },
                          child: Row(
                            children: [
                              Icon(Icons.attach_money),
                              SizedBox(width: 10),
                              Text("Cash"),
                              Spacer(),
                              Icon(Icons.forward)
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          children: [
                            SizedBox(
                              width: screenwidth / 1.2,
                              child: FlatButton(
                                height: 40,
                                child: Text(
                                  'Confirm Carmee',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                color: Colors.black,
                                textColor: Colors.white,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
