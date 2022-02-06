import 'package:video_app/features/video_feed/domain/usecases/fetch_videos_usecase.dart';
import 'package:video_app/features/video_feed/presentation/bloc/video_event.dart';
import 'package:video_app/features/video_feed/presentation/bloc/video_state.dart';
import 'package:bloc/bloc.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final FetchVideosUsecase fetchVideosUsecase;

  VideoBloc({required this.fetchVideosUsecase}) : super(InitialState());

  @override
  Stream<VideoState> mapEventToState(
    VideoEvent event,
  ) async* {
    if (event is FetchVideoListEvent) {
      var result = await fetchVideosUsecase.execute();
      yield result.fold((failure) => ErrorState(),
          (right) => ReceivedVideoState(videos: right));
    }
  }
}
