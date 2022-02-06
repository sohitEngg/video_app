import 'package:either_dart/either.dart';
import 'package:video_app/core/failures.dart';
import 'package:video_app/features/video_feed/domain/entities/video.dart';

abstract class VideoRepository {
  Future<Either<Failures, List<Video>>> fetchVideosList();
}
