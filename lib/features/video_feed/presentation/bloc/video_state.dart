import 'package:equatable/equatable.dart';
import 'package:video_app/features/video_feed/domain/entities/video.dart';

abstract class VideoState extends Equatable {
  const VideoState();
}

class InitialState extends VideoState {
  @override
  List<Object?> get props => [];
}

class ReceivedVideoState extends VideoState {
  final List<Video> videos;
  const ReceivedVideoState({required this.videos});

  @override
  List<Object?> get props => [videos];
}

class ErrorState extends VideoState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
