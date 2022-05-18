import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../data/location.dart' as locations;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Sample App'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(42.86409393745507, 74.57551281899214),
          zoom: 12,
        ),
        onTap: (val) async {
          final address = await placemarkFromCoordinates(
              val.latitude, val.longitude,
              localeIdentifier: 'ru');
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("My title"),
                content: Text("${address[0]}"),
              );
            },
          );
        },
      ),
    );
  }
}
