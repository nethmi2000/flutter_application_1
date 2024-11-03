import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'fish_detect.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;
  String fishName = ""; // To store the detected fish name from the backend

  // Open gallery to select an image
  Future<void> _openGallery() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Open camera to capture an image
  Future<void> _startCamera() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Function to send base64 image to the backend for prediction
  Future<void> getPrediction() async {
    final url = Uri.parse(
        'http://10.0.2.2:5000/predict'); // Adjust this URL if using a physical device

    if (_image == null) {
      print("No image selected.");
      return;
    }

    // Convert image to base64
    final bytes = await _image!.readAsBytes();
    final base64Image = base64Encode(bytes);

    // Prepare JSON payload
    final Map<String, dynamic> data = {
      'image': base64Image,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        setState(() {
          fishName = result['predicted_class']; // Save detected fish name
        });
        print('Detected Fish: $fishName');
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Connection error: $e');
    }
  }

  // Trigger detection and send base64 image to backend
  void _detect() async {
    if (_image != null) {
      // Call getPrediction with the base64 image
      await getPrediction();

      // Navigate to FishDetectScreen if fishName is available
      if (fishName.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FishDetectScreen(
              imageFile: _image,
              fishName: fishName,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Prediction failed. Try again.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No image selected')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🐬Buddy Image Upload🦑"),
        backgroundColor: const Color.fromARGB(52, 76, 175, 79),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 600,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/I1.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 50),
              _buildGradientButton("Open Gallery", _openGallery),
              const SizedBox(height: 10),
              _buildGradientButton("Start Camera", _startCamera),
              Expanded(
                child: Center(
                  child: _image == null
                      ? const Text(
                          "TO DETECT DISEASE.",
                          style: TextStyle(
                              color: Color.fromARGB(24, 1, 89, 99),
                              fontSize: 20),
                        )
                      : Image.file(
                          _image!,
                          height: 600,
                          width: 400,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: _buildGradientButton("DETECT", _detect),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton _buildGradientButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.purple, Colors.green],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
