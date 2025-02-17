import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerApp extends StatefulWidget {
  const VideoPlayerApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerAppState createState() => _VideoPlayerAppState();
}

class _VideoPlayerAppState extends State<VideoPlayerApp> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isAutoRotateEnabled = true;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    // ignore: deprecated_member_use
    _controller = VideoPlayerController.network(
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    )..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _controller.play();
      }).catchError((error) {
        if (kDebugMode) {
          print('Error initializing video: $error');
        }
      });
  }

  void _toggleAutoRotate() {
    setState(() {
      _isAutoRotateEnabled = !_isAutoRotateEnabled;
      if (_isAutoRotateEnabled) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      }
    });
  }

  void _setOrientation(bool isPortrait) {
    if (isPortrait) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player with Rotation'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isInitialized)
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            else
              const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _setOrientation(true),
                  child: const Text('Portrait'),
                ),
                ElevatedButton(
                  onPressed: () => _setOrientation(false),
                  child: const Text('Landscape'),
                ),
                ElevatedButton(
                  onPressed: _toggleAutoRotate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isAutoRotateEnabled ? Colors.green : Colors.grey,
                  ),
                  child: Text(_isAutoRotateEnabled
                      ? 'Disable Auto-Rotate'
                      : 'Enable Auto-Rotate'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    // Reset to default orientations when disposing
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }
}
