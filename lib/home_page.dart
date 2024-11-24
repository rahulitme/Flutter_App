import 'package:flutter/material.dart';
import 'package:myapp/SolutionPage.dart';
import 'package:myapp/plasticwaste.dart';

// Main HomePage with sections for Plastic Waste and Recycling Solutions
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plastic Waste and Solutions'),
        backgroundColor: Colors.green,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Plastic Waste Section with Navigation
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Navigate to Plastic Waste Details Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PlasticWasteDetailPage()),
                );
              },
              child: Container(
                color: Colors.red.shade100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/plastic_waste.png', // Add your plastic waste image
                      height: 150,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Plastic Waste',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Plastic waste is a major environmental concern. Tap to learn more.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Solution Section with Navigation
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Navigate to Solution Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SolutionPage()),
                );
              },
              child: Container(
                color: Colors.green.shade100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/recycling.png', // Add your recycling solution image
                      height: 150,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Recycling Solutions',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Tap to learn about recycling and other solutions.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Page showing details about Plastic Waste
