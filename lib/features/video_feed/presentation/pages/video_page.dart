import 'package:flutter/material.dart';
import 'package:video_app/features/video_feed/presentation/widgets/my_video_player.dart';
import 'package:video_app/features/video_feed/domain/entities/video.dart';
import 'package:video_app/features/video_feed/presentation/bloc/video_bloc.dart';
import 'package:video_app/features/video_feed/presentation/bloc/video_event.dart';
import 'package:video_app/features/video_feed/presentation/bloc/video_state.dart';
import 'package:video_app/injection/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = di<VideoBloc>();
    bloc.add(FetchVideoListEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _buildPage());
  }

  _buildPage() {
    return BlocConsumer(
        bloc: bloc,
        builder: (BuildContext context, state) {
          if (state is ReceivedVideoState) {
            if (state.videos.length > 1) {
              return _buildVideoList(state.videos);
            }
            return const Center(
              child: Text('No videos found!'),
            );
          }
          return const Center(
            child: Text('Loading...'),
          );
        },
        listener: (BuildContext context, Object? state) {});
  }

  _buildVideoList(List<Video> videos) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
              title: MyVideoPlayer(
                  key: const Key('v'),
                  videoUrl: videos[index].videoUrl,
                  fallbackImageUrl: videos[index].coverPicture,
                  onVisibilityChanged: true,
                  fallbackImageKey: const Key('fi')));
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
          );
        },
        itemCount: videos.length - 55);
  }
}
