// ignore: file_names
import 'package:flutter/material.dart';
import 'package:myapp/GarbageCollectionPage%20.dart';

void main() {
  runApp(const GarbageCollectionApp());
}

class GarbageCollectionApp extends StatelessWidget {
  const GarbageCollectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garbage Collection Animator',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const GarbageCollectionPage(),
    );
  }
}
