import 'package:video_app/features/video_feed/domain/entities/video.dart';

class VideoModel extends Video {
  const VideoModel(
      {required id, required title, required videoUrl, required coverPicture})
      : super(
            id: id,
            title: title,
            videoUrl: videoUrl,
            coverPicture: coverPicture);

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
        id: (json['id'] as double).toInt(),
        title: json['title'],
        videoUrl: json['videoUrl'],
        coverPicture: json['coverPicture']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'videoUrl': videoUrl,
      'coverPicture': coverPicture
    };
  }
}
