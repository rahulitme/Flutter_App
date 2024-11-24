import 'package:flutter/material.dart';

class PlasticWasteDetailPage extends StatelessWidget {
  const PlasticWasteDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plastic Waste Details'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/plastic_waste.png', // Add a plastic waste image
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Plastic Waste Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Plastic waste is one of the leading causes of environmental pollution. It takes years to decompose and contributes to harmful waste.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Page showing details about Recycling Solutions
