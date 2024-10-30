import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Welcome/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text with emojis
            Text(
              "🐳  Fish Buddy!!! ",
              style: TextStyle(
                fontFamily: 'Curlz MT', // Replace with your desired font family
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.teal,
                letterSpacing: 1.2,
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              "assets/images/T1.png",
              height: size.height * 0.4,
            ),
            SizedBox(height: 40), // Space between image and buttons
            // Sign In Button
            ElevatedButton(
              onPressed: () {
                // Add your sign-in logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Button color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
              ),
              child: Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white, // Text color
                ),
              ),
            ),
            SizedBox(height: 20), // Space between buttons
            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                // Add your sign-up logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white, // Text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
