import 'package:flutter/material.dart';
import 'package:maps_example/map.dart';

//import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maps and Geolocation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapsPage(title: 'Maps and Geolocation'),
    );
  }
}

class MapsPage extends StatefulWidget {
  MapsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  Map map = new Map();
  List<LocationClass> locationList = List<LocationClass>();

  var _geolocator = Geolocator();
  Position _userLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.zoom_in),
          onPressed: () {
            map.zoomin();
          },
        ),
        IconButton(
          icon: Icon(Icons.zoom_out),
          onPressed: () {
            map.zoomout();
          },
        ),
      ]),
      body: map,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get position
          _geolocator
              .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
              .then((Position userLocation) {
            _userLocation = userLocation;
          });
          // Obtain placemark for current position
          _getPlacemark(_userLocation);
          print("Current Location List is $locationList\n\n");
          // Setting the center and path
          map.setCentre(locationList[0].latlng);
          map.setPath(locationList);
          map.centerMap();
          map.buildMarkers(locationList);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    // geolocator plug-in version:
    _geolocator
        .checkGeolocationPermissionStatus()
        .then((GeolocationStatus geolocationStatus) {
      print('Geolocation status: $geolocationStatus.');
    });

    try {
      _geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position userLocation) {
        _userLocation = userLocation;
      });
    } catch (e) {}
  }

  Future<void> _getPlacemark(userLocation) async {
    try {
      _geolocator
          .placemarkFromCoordinates(
              userLocation.latitude, userLocation.longitude)
          .then((List<Placemark> places) {
        print('Creating location from current coordinates:');
        for (Placemark place in places) {
          String address = '${place.subThoroughfare} ${place.thoroughfare}';
          LatLng latlng =
              new LatLng(userLocation.latitude, userLocation.longitude);
          // Create instance of LocationClass
          LocationClass loc = LocationClass(place.name, address, latlng);
          // Add new location to the list
          locationList.add(loc);
        }
      });
    } catch (e) {
      throw e;
    }
  }
}

class LocationClass {
  String name;
  String address;
  LatLng latlng;

  // Constructor
  LocationClass(this.name, this.address, this.latlng);

  @override
  String toString() {
    return 'Location{Name: $name, Address: $address, LatLng: $latlng}';
  }
}
