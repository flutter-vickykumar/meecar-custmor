import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place/search_map_place.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        // primary: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 10),
        child: Column(
          children: [
            // Text(geolocation),
            SearchMapPlaceWidget(
              placeholder: "Enter Pickup location",
              apiKey: 'AIzaSyDUf33SUpxwP0CULwFlqXCS3QRnzUr_l9U',
              // The language of the autocompletion
              language: 'en',
              // The position used to give better recomendations. In this case we are using the user position
              // location: userPosition.coordinates,
              location: LatLng(50, 50),
              radius: 30000,
              onSelected: (Place place) async {
                final geolocation = await place.geolocation;
                print("--------------------------------");
                print(geolocation.coordinates);
                print("--------------------------------");

                // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom
                // final GoogleMapController controller = await _mapController.future;
                // controller.animateCamera(CameraUpdate.newLatLng(geolocation.coordinates));
                // controller.animateCamera(CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
              },
            ),
            SizedBox(height: 10),
            SearchMapPlaceWidget(
              placeholder: "Where to ?",

              apiKey: 'AIzaSyDUf33SUpxwP0CULwFlqXCS3QRnzUr_l9U',
              // The language of the autocompletion
              language: 'en',
              // The position used to give better recomendations. In this case we are using the user position
              // location: userPosition.coordinates,
              location: LatLng(50, 50),
              radius: 30000,
              onSelected: (Place place) async {
                final geolocation = await place.geolocation;
                print(geolocation.fullJSON);

                // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom
                // final GoogleMapController controller = await _mapController.future;
                // controller.animateCamera(CameraUpdate.newLatLng(geolocation.coordinates));
                // controller.animateCamera(CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Text(
                  'Search ',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.grey,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/ChooseCar');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
