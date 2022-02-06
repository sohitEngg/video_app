import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MyVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String fallbackImageUrl;
  final bool onVisibilityChanged;
  final Key fallbackImageKey;

  const MyVideoPlayer({
    required Key key,
    required this.videoUrl,
    required this.fallbackImageUrl,
    required this.onVisibilityChanged,
    required this.fallbackImageKey,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController _vpController;

  final _videoPlayerOptions = VideoPlayerOptions(mixWithOthers: true);

  // check if video link contains '_NOLOOP' or not
  bool get _isContainsNoLoop => true;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  _initializeVideo() {
    _vpController = VideoPlayerController.network(
      widget.videoUrl,
      videoPlayerOptions: _videoPlayerOptions,
    );
    _vpController.setLooping(!_isContainsNoLoop);

    _vpController.addListener(() {
      if (_vpController.value.hasError) {
        if (mounted) {
          setState(() {});
        }
      }
    });
    _vpController.initialize().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
    _vpController.play();
  }

  @override
  void dispose() {
    _vpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: _buildPlaceholderImage(),
        ),
        Positioned.fill(
          child: _buildVideoPlayer(),
        ),
      ],
    );
  }

  _buildVideoPlayer() {
    return VisibilityDetector(
      key: ObjectKey(widget),
      onVisibilityChanged: (_) {
        if (widget.onVisibilityChanged) {
          if (_.visibleFraction < 0.8) {
            if (mounted) {
              setState(() {
                _vpController.pause();
              });
            }
          } else if (_.visibleFraction == 1.0) {
            if (mounted) {
              setState(() {
                _vpController.play();
              });
            }
          }
        }
      },
      child: _vpController.value.isInitialized
          ? AspectRatio(
              aspectRatio: 3 / 2,
              child: VideoPlayer(_vpController),
            )
          : Container(),
    );
  }

  /// return Image from network url if url is valid, else return a sized-box
  _buildPlaceholderImage() {
    return Image.network(
      widget.fallbackImageUrl,
      fit: BoxFit.cover,
    );
  }
}
