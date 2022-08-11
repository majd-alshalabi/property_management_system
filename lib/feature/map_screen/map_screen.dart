import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:property_management_system/feature/add_screen/bloc/cubit/add_screen_cubit_cubit.dart';
import 'package:property_management_system/injection_container.dart';

class MapScreen extends StatefulWidget {
  final bool locationPicker;

  const MapScreen({Key? key, this.locationPicker = false}) : super(key: key);

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
          child: FaIcon(widget.locationPicker
              ? FontAwesomeIcons.pizzaSlice
              : FontAwesomeIcons.locationArrow),
          onPressed: () async {
            if (!widget.locationPicker) {
              Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.lowest)
                  .then((value) async {
                await mapController!.animateCamera(CameraUpdate.newLatLngZoom(
                    LatLng(value.latitude, value.longitude), 15));
              });
            } else {
              double screenWidth = MediaQuery.of(context).size.width *
                  MediaQuery.of(context).devicePixelRatio;
              double screenHeight = MediaQuery.of(context).size.height *
                  MediaQuery.of(context).devicePixelRatio;

              double middleX = screenWidth / 2;
              double middleY = screenHeight / 2;

              ScreenCoordinate screenCoordinate =
                  ScreenCoordinate(x: middleX.round(), y: middleY.round());

              LatLng middlePoint =
                  await mapController!.getLatLng(screenCoordinate);
              sl<AddScreenCubit>().setLatLng(middlePoint);
              Navigator.pop(context);
            }
          },
        ),
        body: Stack(
          alignment: Alignment.center,
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
            if (widget.locationPicker) ...[
              Container(
                width: 10,
                height: 10,
                color: Colors.red,
              ),
              Icon(Icons.center_focus_strong),
            ]
          ],
        ),
      ),
    );
  }

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
