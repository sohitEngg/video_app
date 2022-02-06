import 'package:equatable/equatable.dart';

class Video extends Equatable {
  const Video(
      {required this.id,
      required this.title,
      required this.videoUrl,
      required this.coverPicture});

  final int id;
  final String title;
  final String videoUrl;
  final String coverPicture;

  @override
  List<Object> get props => [id, title, videoUrl, coverPicture];

  @override
  bool get stringify => false;
}
