import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:maps_example/main.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';

class Map extends StatelessWidget {
  var centre;
  var path = List<LatLng>();
  List<Marker> markerList = List<Marker>();
  
  MapController _mapController = MapController();
  double _zoom = 18.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          minZoom: 16.0,
          //maxZoom: 20.0,
          zoom: _zoom,
          center: centre,
        ),
        layers: [
          TileLayerOptions(
            // for MapBox:
            urlTemplate:
                'https://api.mapbox.com/styles/v1/danbullockcs/ck3gs4cdb0e4k1cp7pkt5pcvd/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZGFuYnVsbG9ja2NzIiwiYSI6ImNrM2RjN3hybDB2bm4zb3BiZHN4a25hbjAifQ.76_zGIc3VpbmIH9R0Ygpaw',
          ),
          MarkerLayerOptions(
            markers: markerList,
          ),
          PolylineLayerOptions(
            polylines: [
              Polyline(
                points: path,
                strokeWidth: 4.0,
                color: Colors.blue,
              ),
            ],
          ),
        ],
        mapController: _mapController,
      ),
    );
  }

  void buildMarkers(var locationList) {
    for (LocationClass loc in locationList) {
      markerList.add(Marker(
        width: 45.0,
        height: 45.0,
        point: loc.latlng,
        builder: (context) => Container(
          child: IconButton(
            icon: Icon(Icons.location_on),
            color: Colors.blue,
            iconSize: 45.0,
            onPressed: () {
              print('Icon clicked');
            },
          ),
        ),
      ));
    }
  }

  void centerMap() {
    _mapController.move(centre, _zoom);
  }

  void zoomin() {
    print("zooming in");
    _zoom += 0.25;
    _mapController.move(centre, _zoom);
  }

  void zoomout() {
    print("zooming out");
    _zoom -= 0.25;
    _mapController.move(centre, _zoom);
  }

  void setCentre(var _centre) {
    centre = _centre;
  }

  void setPath(var locationList) {
    path = [];
    for (LocationClass loc in locationList) {
      path.add(loc.latlng);
      //path.add(LatLng(37.421098, -122.084));
    }
    print("PATH IS $path");
  }
}
