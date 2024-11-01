import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController _controller;
  Set<Marker> _markers = {};
  final TextEditingController _locationController = TextEditingController();

  // Replace with your own API keys
  final String _geocodingApiKey = 'AIzaSyApHYUH5MfQaCitqMVVbp58DkPYExV6Iw8';
  final String _placesApiKey = 'AIzaSyApHYUH5MfQaCitqMVVbp58DkPYExV6Iw8';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🐳  Nearby Aquariums 📍'),
        backgroundColor: const Color.fromARGB(255, 76, 175, 79),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: '▶️ Enter Location 🐋 (e.g., Galle)',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _searchAquariumsNearby(_locationController.text);
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

  Future<void> _searchAquariumsNearby(String location) async {
    try {
      // Step 1: Get coordinates of the location
      final coordinates = await _getCoordinatesFromLocation(location);
      if (coordinates == null) {
        _showErrorMessage('Location not found');
        return;
      }

      // Move the map to the new location
      _controller.animateCamera(
        CameraUpdate.newLatLngZoom(coordinates, 12),
      );

      // Step 2: Search for aquariums nearby
      final nearbyAquariums = await _getNearbyAquariums(coordinates);
      setState(() {
        _markers.clear();
        for (var place in nearbyAquariums) {
          _markers.add(
            Marker(
              markerId: MarkerId(place['place_id']),
              position: LatLng(place['geometry']['location']['lat'], place['geometry']['location']['lng']),
              infoWindow: InfoWindow(
                title: place['name'],
                snippet: place['vicinity'],
              ),
            ),
          );
        }
      });
    } catch (e) {
      _showErrorMessage('Error occurred: $e');
    }
  }

  Future<LatLng?> _getCoordinatesFromLocation(String location) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?address=$location&key=$_geocodingApiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        final lat = data['results'][0]['geometry']['location']['lat'];
        final lng = data['results'][0]['geometry']['location']['lng'];
        return LatLng(lat, lng);
      }
    }
    return null;
  }

  Future<List<dynamic>> _getNearbyAquariums(LatLng coordinates) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${coordinates.latitude},${coordinates.longitude}&radius=5000&type=aquarium&key=$_placesApiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        return data['results'];
      }
    }
    return [];
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}