import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SpexPage extends StatelessWidget {
  const SpexPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spex Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Spex Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 200,
              width: 200,
              child: LottieBuilder.asset('assets/shopping.json'),
            ),
            const SizedBox(height: 50),
            const Text(
              'add items to cart',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}