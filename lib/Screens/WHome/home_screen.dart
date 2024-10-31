import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/WHome/image_upload.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  HomeScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("🐳  🐠  🐙  🦑  🐋  🐬  🪼  🐳 "),
        backgroundColor: const Color.fromARGB(77, 0, 150, 135),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Greeting message
            Text(
              "Welcome,Buddy Family!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),

            // Message box for introduction text
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.green],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(20),
              margin:
                  EdgeInsets.symmetric(vertical: 20), // Margin around the box
              child: Column(
                children: [
                  Text(
                    "Fish Buddy is a mobile application designed to assist fish enthusiasts, "
                    "aquarium owners, and hobbyists in identifying fish diseases  "
                    "and locating nearby treatment resources..",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, // Text color for better contrast
                    ),
                  ),
                ],
              ),
            ),
            // Image under the introduction text
            Image.asset(
              "assets/images/H1.png", // Replace with your image path
              width: size.width * 0.8, // Adjust the width as needed
              fit:
                  BoxFit.cover, // Cover the area while maintaining aspect ratio
            ),
            Spacer(), // Space to push buttons to the bottom
            // Row for buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous button
                ElevatedButton(
                  onPressed: () {
                    // Logic to navigate to the previous screen
                    Navigator.pop(context); // Go back to the login screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text("Previous"),
                ),
                // Next button
                ElevatedButton(
                  onPressed: () {
                    // Logic to navigate to the next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageUploadScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text("    Next     "),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder for the next screen
class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next Screen"),
      ),
      body: Center(
        child: Text("This is the next screen!"),
      ),
    );
  }
}
