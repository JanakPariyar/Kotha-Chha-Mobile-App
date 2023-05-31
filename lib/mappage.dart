import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final LatLng initialPosition = LatLng(37.7749, -122.4194); // Set the initial map position to San Francisco

  Set<Marker> markers = {}; // Set of markers to display on the map

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: initialPosition,
          zoom: 12.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
          // Call a function to fetch markers from your data source
          fetchMarkers();
        },
        markers: markers,
      ),
    );
  }

  void fetchMarkers() {
    // Fetch markers from your data source
    // Here is an example with a hardcoded marker:
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId('1'),
          position: LatLng(37.7749, -122.4194),
          infoWindow: InfoWindow(title: 'Marker Title', snippet: 'Marker Snippet'),
        ),
      );
    });
  }
}
