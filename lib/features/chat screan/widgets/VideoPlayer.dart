import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  final String videoUrl;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late CachedVideoPlayerController _videoPlayerController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = CachedVideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {}); // Ensures that the UI is updated after initialization.
        _videoPlayerController.setVolume(1);
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _videoPlayerController.pause();
      } else {
        _videoPlayerController.play();
      }
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _videoPlayerController.value.isInitialized
          ? _videoPlayerController.value.aspectRatio
          : 16 / 9,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (_videoPlayerController.value.isInitialized)
            CachedVideoPlayer(_videoPlayerController)
          else
            const Center(child: CircularProgressIndicator()), // Loading indicator

          GestureDetector(
            onTap: _togglePlayPause,
            child: AnimatedOpacity(
              opacity: _isPlaying ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: Icon(
                _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                size: 60,
                color: Colors.white.withValues(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
