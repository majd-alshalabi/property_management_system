import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreen createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  GoogleMapController? mapController;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  CameraPosition _initialCameraPosition =
      CameraPosition(target: const LatLng(33.510414, 36.278336), zoom: 12);

  @override
  void initState() {
    super.initState();
    markers[MarkerId('majd')] = Marker(
        markerId: MarkerId('majd'),
        alpha: 0.8,
        onTap: () {
          print('majjj');
        },
        position: LatLng(33.510414, 36.278336),
        icon: BitmapDescriptor.defaultMarker);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.locationArrow),
          onPressed: () async {
            Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.lowest)
                .then((value) async {
              await mapController!.animateCamera(CameraUpdate.newLatLngZoom(
                  LatLng(value.latitude, value.longitude), 15));
            });
          },
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: onMapCreated,
              markers: Set<Marker>.of(markers.values),
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                new Factory<OneSequenceGestureRecognizer>(
                  () => new EagerGestureRecognizer(),
                ),
              ].toSet(),
              mapToolbarEnabled: false,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              scrollGesturesEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: _initialCameraPosition,
            ),
          ],
        ),
      ),
    );
  }

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
