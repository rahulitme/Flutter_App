// ignore: file_names
import 'package:flutter/material.dart';
import 'package:myapp/main1.dart';

class GarbageCollectionPage extends StatefulWidget {
  const GarbageCollectionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GarbageCollectionPageState createState() => _GarbageCollectionPageState();
}

class _GarbageCollectionPageState extends State<GarbageCollectionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  // Stages of garbage collection
  final List<String> _stages = [
    'Waste Collection Starts',
    'Garbage Truck Arrives',
    'Waste Transportation',
    'Sorting Facility',
    'Recycling Process',
    'Waste Disposal Complete',
  ];

  int _currentStage = 0;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  void _startGarbageCollectionCycle() {
    setState(() {
      _currentStage = 0;
    });

    // Create a recursive animation cycle
    void cycleStages() {
      if (_currentStage < _stages.length - 1) {
        _animationController.forward(from: 0);

        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _currentStage++;
          });
          cycleStages();
        });
      } else {
        // Reset when cycle completes
        setState(() {
          _currentStage = 0;
        });
      }
    }

    cycleStages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garbage Collection Animator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated stage display
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: _getStageColor(_currentStage),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  _stages[_currentStage],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Visual representation of stages
            _buildStageIndicator(),

            const SizedBox(height: 30),

            // Start Animation Button
            ElevatedButton(
              onPressed: _startGarbageCollectionCycle,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text('Start Garbage Collection'),
            ),

            const SizedBox(height: 20),

            // Navigate to next page button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text('Go to Next Page'),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to get stage-specific color
  Color _getStageColor(int stage) {
    switch (stage) {
      case 0:
        return Colors.grey.shade700; // Preparation
      case 1:
        return Colors.blue.shade600; // Collection
      case 2:
        return Colors.green.shade600; // Transportation
      case 3:
        return Colors.orange.shade600; // Sorting
      case 4:
        return Colors.purple.shade600; // Recycling
      case 5:
        return Colors.teal.shade600; // Disposal Complete
      default:
        return Colors.grey;
    }
  }

  // Build stage progress indicator
  Widget _buildStageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_stages.length, (index) {
        return Container(
          width: 20,
          height: 20,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index <= _currentStage ? Colors.green : Colors.grey,
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

// Define the next page widget
