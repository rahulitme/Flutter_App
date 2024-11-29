import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:myapp/%20GarbageCollectionApp%20.dart';
import 'package:myapp/main1.dart';
import 'dart:math'; // Required for rotation
import 'home_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';
import 'feedback.dart';
import 'help_page.dart';
import 'spex_page.dart'; 
import 'NextPag.dart';
// Add this import

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GarbageCollectionApp(),
    );
  }
}
