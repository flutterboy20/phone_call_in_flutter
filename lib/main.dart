import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

_makingPhoneCall() async {
  const url = 'tel:1234567890';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // SafeArea is a widget used to balance the screen
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Phone call in Flutter'), // AppBar/App title
            backgroundColor: Colors.purple, // AppBar color which is purple
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Press the button to make a phone call',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // Elevated Button Used to make call
                  ElevatedButton(
                    onPressed: _makingPhoneCall,
                    child: const Text('Call'), // Text in the button
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple, // Button's Color
                        minimumSize: const Size(100, 40)), // Button's Size
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
