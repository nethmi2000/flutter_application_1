import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;

  Future<void> _openGallery() async {
    print("Open Gallery button pressed");
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print("No image selected");
    }
  }

  Future<void> _startCamera() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image =
            File(pickedFile.path); // Update the state with the captured image
      });
    }
  }

  void _detect() {
    // Implement detection logic here
    print("Detect button pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🐬Buddy Image Upload🦑"),
        backgroundColor:
            const Color.fromARGB(52, 76, 175, 79), // Set AppBar color here
      ),
      body: Stack(
        children: [
          // Background Image
          Center(
            child: Container(
              width: 600, // Adjust width of the background image
              height: 400, // Adjust height of the background image
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/I1.png'), // Background image path
                  fit: BoxFit.contain, // Adjust to fit within the container
                ),
              ),
            ),
          ),
          // Main content with buttons and image display
          Column(
            children: [
              const SizedBox(height: 50), // Space from top of the screen
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
                          height: 600, // Adjustable height for displayed image
                          width: 400, // Adjustable width for displayed image
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ],
          ),
          // DETECT button near the bottom
          Positioned(
            bottom: 60, // Position the button slightly above the bottom
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
            colors: [Colors.purple, Colors.green], // Combine purple and green
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white), // Button text color
          ),
        ),
      ),
    );
  }
}
