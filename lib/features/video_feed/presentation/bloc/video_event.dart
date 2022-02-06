import 'package:equatable/equatable.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();
}

class FetchVideoListEvent extends VideoEvent {
  @override
  List<Object?> get props => [];
}
