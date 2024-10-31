import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image; // Variable to hold the selected image

  Future<void> _openGallery() async {
    print("Open Gallery button pressed"); // Debugging
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image =
            File(pickedFile.path); // Update the state with the selected image
      });
    } else {
      print("No image selected"); // Debugging
    }
  }

  Future<void> _startCamera() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image =
            File(pickedFile.path); // Update the state with the captured image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Upload"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? Text("No image selected.")
                : Image.file(_image!), // Display the selected or captured image
            SizedBox(height: 20), // Add some space
            ElevatedButton(
              onPressed: _openGallery,
              child: Text("Open Gallery"),
            ),
            SizedBox(height: 10), // Add some space
            ElevatedButton(
              onPressed: _startCamera,
              child: Text("Start Camera"),
            ),
          ],
        ),
      ),
    );
  }
}
