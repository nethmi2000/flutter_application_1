import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/WHome/image_upload.dart';

class HomeScreen extends StatelessWidget {
  final String username; // Added required 'username' parameter

  const HomeScreen({super.key, required this.username}); // Updated constructor to require 'username'

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("🐳  🐠  🐙  🦑  🐋  🐬  🪼  🐳 "),
        backgroundColor: const Color.fromARGB(77, 0, 150, 135),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView( // Wrap Column with SingleChildScrollView to make it scrollable
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Greeting message that includes the username
                  Text(
                    "Welcome, $username!", // Used 'username' in greeting
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Message box for introduction text
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.purple, Colors.green],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: const Text(
                      "Fish Buddy is a mobile application designed to assist fish enthusiasts, "
                          "aquarium owners, and hobbyists in identifying fish diseases "
                          "and locating nearby treatment resources.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Image under the introduction text
                  Image.asset(
                    "assets/images/H1.png",
                    width: size.width * 0.8,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20), // Add spacing to adjust layout
                ],
              ),
            ),
          ),

          // Row for buttons fixed at the bottom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the login screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text("Previous"),
                ),

                // Next button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageUploadScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text("Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder for the next screen
class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Next Screen"),
      ),
      body: const Center(
        child: Text("This is the next screen!"),
      ),
    );
  }
}
