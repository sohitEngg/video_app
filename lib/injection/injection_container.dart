import 'package:get_it/get_it.dart';
import 'package:video_app/core/assets_reader.dart';
import 'package:video_app/features/video_feed/data/datasources/video_data_source.dart';
import 'package:video_app/features/video_feed/data/repositories/video_repository_impl.dart';
import 'package:video_app/features/video_feed/domain/repositories/video_repository.dart';
import 'package:video_app/features/video_feed/domain/usecases/fetch_videos_usecase.dart';
import 'package:video_app/features/video_feed/presentation/bloc/video_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.registerLazySingleton<AssetReader>(() => AssetReader());

  di.registerFactory<VideoDataSource>(() => VideoDataSource(assetReader: di()));

  di.registerFactory<VideoRepository>(
      () => VideoRepositoryImpl(dataSource: di()));

  di.registerFactory<FetchVideosUsecase>(
      () => FetchVideosUsecase(repository: di()));

  di.registerFactory<VideoBloc>(() => VideoBloc(fetchVideosUsecase: di()));
}
