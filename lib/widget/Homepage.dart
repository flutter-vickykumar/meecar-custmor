import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meecar/widget/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  Completer<GoogleMapController> _controller = Completer();
  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};
  int _polylineIdCounter = 1;
  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-8.913455, 13.203063),
    zoom: 17.18,
  );

  @override
  void initState() {
    super.initState();
    _addtripPoly();
  }

  void _addtripPoly() {
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.black,
      width: 5,
      points: _createTripPoints(),
      onTap: () {},
    );

    setState(() {
      polylines[polylineId] = polyline;
    });
  }

  LatLng _createLatLng(double lat, double lng) {
    return LatLng(lat, lng);
  }

  List<LatLng> _createTripPoints() {
    final List<LatLng> points = <LatLng>[];
    points.add(_createLatLng(-8.913012, 13.202450));
    points.add(_createLatLng(-8.913297, 13.202253));
    points.add(_createLatLng(-8.913752, 13.202803));
    points.add(_createLatLng(-8.913455, 13.203063));
    return points;
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: HomeMenuDrawer(),
      ),
      body: Column(
        children: [
          Container(
            height: 170,
            width: screenwidth,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enhance Your Pickup",
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                  Text(
                    "experience",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Get a faster, hassle-free pickup at your",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    'precise location',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Row(
                    children: [
                      Text(
                        "share location ->",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      Spacer(),
                      Image.asset(
                        "assets/images/men_img.JPG",
                        height: 40,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/myhomepage");
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/men_img.JPG",
                          height: 80,
                        ),
                        Text("Ride"),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/men_img.JPG",
                        height: 80,
                      ),
                      Text("Package"),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/men_img.JPG",
                        height: 80,
                      ),
                      Text("Rentals"),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/myhomepage");
              },
              child: Container(
                height: 50,
                width: screenwidth,
                color: Colors.grey,
                child: Center(child: Text("Enter pickup point")),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.star),
                SizedBox(
                  width: 10,
                ),
                Text("Choose a saved place"),
                Spacer(),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Around you",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              width: double.infinity,
              child: GoogleMap(
                polylines: Set<Polyline>.of(polylines.values),
                mapType: MapType.normal,
                initialCameraPosition: _cameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onTap: (LatLng location) {
                  Navigator.pushNamed(context, "/searchbar");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
