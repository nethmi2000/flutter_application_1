import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/Screens/Welcome/welcome_screen.dart'; // Keep your WelcomeScreen import if needed
import 'package:flutter_application_1/constants.dart';
import 'Screens/WHome/fish_detect.dart';
import 'Screens/WHome/google_map.dart';
import 'Screens/Register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((_) {
    print("Firebase initialized successfully");
  }).catchError((error) {
    print("Error initializing Firebase: $error");
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fish Buddy',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(), // Starting screen
      routes: {
        '/google_map': (context) =>
            GoogleMapScreen(), // Route for Google Map screen
        //'/fish_detect': (context) => FishDetectScreen(), // Route for Fish Detect screen
      },
    );
  }
}
