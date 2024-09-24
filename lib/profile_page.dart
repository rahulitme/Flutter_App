import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  List<String> _imageUrls = [];
  bool _hasSearched = false;
  Offset _floatingButtonPosition = const Offset(100, 100); // initial position of the floating button
  AnimationController? _controller;
  Animation<Offset>? _animation;
  
  // Dummy search function
  void _performSearch(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _hasSearched = true;
        _imageUrls = List.generate(
            6,
            (index) =>
                'https://via.placeholder.com/150?text=Image+${index + 1}');
      });
    }
  }

  // SpeedDial method for the floating button
  SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 28.0),
      backgroundColor: Colors.green[900],
      visible: true,
      curve: Curves.bounceInOut,
      onOpen: () {
        _updateTrailPosition();
      },
      onClose: () {
        _updateTrailPosition();
      },
      children: [
        SpeedDialChild(
          child: const Icon(Icons.chrome_reader_mode, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () {
            _updateTrailPosition();
            if (kDebugMode) {
              print('Pressed Read Later');
            }
          },
          label: 'Read',
          labelStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
        SpeedDialChild(
          child: const Icon(Icons.create, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () {
            _updateTrailPosition();
            if (kDebugMode) {
              print('Pressed Write');
            }
          },
          label: 'Write',
          labelStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
        SpeedDialChild(
          child: const Icon(Icons.laptop_chromebook, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () {
            _updateTrailPosition();
            if (kDebugMode) {
              print('Pressed Code');
            }
          },
          label: 'Code',
          labelStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
      ],
    );
  }

  void _updateTrailPosition() {
    setState(() {
      _floatingButtonPosition = _animation?.value ?? const Offset(100, 100);
    });
  }

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 300),
    ).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search Bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search images...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onSubmitted: (query) {
                    _performSearch(query);
                  },
                ),
                const SizedBox(height: 16),

                // Display Images after search
                if (_hasSearched)
                  Expanded(
                    child: _imageUrls.isNotEmpty
                        ? GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            itemCount: _imageUrls.length,
                            itemBuilder: (context, index) {
                              return Image.network(_imageUrls[index]);
                            },
                          )
                        : const Center(
                            child: Text('No images found'),
                          ),
                  ),
              ],
            ),
          ),
          CustomPaint(
            painter: TrailPainter(_floatingButtonPosition),
            child: Container(),
          ),
        ],
      ),
      floatingActionButton: buildSpeedDial(),
    );
  }
}

class TrailPainter extends CustomPainter {
  final Offset position;

  TrailPainter(this.position);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    // Draw the trail as a circle
    canvas.drawCircle(position, 20.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
