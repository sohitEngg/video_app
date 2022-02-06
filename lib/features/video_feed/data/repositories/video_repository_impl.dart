import 'package:video_app/core/failures.dart';
import 'package:video_app/features/video_feed/data/datasources/video_data_source.dart';
import 'package:video_app/features/video_feed/domain/entities/video.dart';
import 'package:video_app/features/video_feed/domain/repositories/video_repository.dart';
import 'package:either_dart/either.dart';

class VideoRepositoryImpl extends VideoRepository {
  final VideoDataSource dataSource;
  VideoRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failures, List<Video>>> fetchVideosList() async {
    try {
      var list = await dataSource.fetchList();
      return Right(list);
    } catch (e) {
      return Left(ReadFailure());
    }
  }
}
