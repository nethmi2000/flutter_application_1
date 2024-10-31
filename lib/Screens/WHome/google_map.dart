import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController _controller;
  Set<Marker> _markers = {};
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Aquariums'),
        backgroundColor: const Color.fromARGB(255, 76, 175, 79),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Enter Location (e.g., Galle)',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Logic to search for nearby aquariums based on user input
                    // Add a marker at the user's input location
                    _addMarker(_locationController.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(6.9271, 79.8612), // Initial position (Colombo)
                zoom: 10,
              ),
              markers: _markers,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
                child: const Text('Back'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Exit functionality, typically you might close the app
                  // In this case, just pop the context if that's how you manage it
                  Navigator.pop(context);
                },
                child: const Text('Exit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _addMarker(String location) {
    // Logic to convert location to LatLng and add a marker
    // For now, we will just add a dummy marker
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(location),
          position: LatLng(6.9271, 79.8612), // Replace with actual coordinates from location
          infoWindow: InfoWindow(
            title: location,
            snippet: 'Aquarium details can go here',
          ),
        ),
      );
      _controller.animateCamera(
        CameraUpdate.newLatLng(LatLng(6.9271, 79.8612)), // Replace with actual coordinates
      );
    });
  }
}