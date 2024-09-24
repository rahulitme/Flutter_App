import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() => runApp(const MyApp());

_makingPhoneCall() async {
  var url = Uri.parse("tel:9776765434");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Geeks for Geeks'),
          backgroundColor: Colors.green,
        ), // AppBar
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 250.0,
                ),//Container
                const Text(
                  'Welcome to GFG!',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),//TextStyle
                ),//Text
                Container(
                  height: 20.0,
                ),
                const Text(
                  'For further Updates',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 20.0,
                ),
               ElevatedButton(
                  onPressed: _makingPhoneCall,
                  style: ButtonStyle(
                    padding:
                        WidgetStateProperty.all(const EdgeInsets.all(5.0)),
                    textStyle: WidgetStateProperty.all(
                      const TextStyle(color: Colors.black),
                    ),
                  ),
                  child: const Text('Here'),
                ), // ElevatedButton
              ],
            ),
          ),
        ),
      ),
    );
  }
}