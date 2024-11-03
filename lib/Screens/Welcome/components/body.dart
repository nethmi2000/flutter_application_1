import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/WHome/image_upload.dart';
import 'package:flutter_application_1/Screens/Welcome/components/background.dart';
import 'package:flutter_application_1/Screens/Login/login_screen.dart';
import 'package:flutter_application_1/Screens/Register/register_screen.dart';
import 'package:flutter_application_1/Screens/WHome/home_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

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
              "🐳  Fish Buddy ",
              style: TextStyle(
                fontFamily: 'Curlz MT',
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.teal,
                letterSpacing: 1.2,
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              "assets/images/T1.png",
              height: size.height * 0.4,
            ),
            const SizedBox(height: 40), // Space between image and buttons

            // Sign In Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the login screen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Button color
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
              ),
              child: const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white, // Text color
                ),
              ),
            ),
            const SizedBox(height: 20), // Space between buttons

            ////////////////////////////////////////////////////////////////////test home & upload image
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => HomeScreen(
            //                 username: '',
            //               )),
            //     );
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.green, // Button color
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(30), // Rounded corners
            //     ),
            //   ),
            //   child: const Text(
            //     "home",
            //     style: TextStyle(
            //       fontSize: 20,
            //       color: Colors.white, // Text color
            //     ),
            //   ),
            // ),
            //
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => ImageUploadScreen()),
            //     );
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.green, // Button color
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(30), // Rounded corners
            //     ),
            //   ),
            //   child: const Text(
            //     "image",
            //     style: TextStyle(
            //       fontSize: 20,
            //       color: Colors.white, // Text color
            //     ),
            //   ),
            // ),

            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
              ),
              child: const Text(
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
