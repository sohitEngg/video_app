import 'package:video_app/core/failures.dart';
import 'package:video_app/features/video_feed/domain/entities/video.dart';
import 'package:video_app/features/video_feed/domain/repositories/video_repository.dart';
import 'package:either_dart/either.dart';

class FetchVideosUsecase {
  final VideoRepository repository;

  FetchVideosUsecase({required this.repository});

  Future<Either<Failures, List<Video>>> execute() async {
    return await repository.fetchVideosList();
  }
}
