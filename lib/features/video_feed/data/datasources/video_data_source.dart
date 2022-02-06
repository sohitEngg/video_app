import 'package:video_app/core/assets_reader.dart';
import 'package:video_app/features/video_feed/data/models/video_model.dart';

class VideoDataSource {
  final AssetReader assetReader;
  VideoDataSource({required this.assetReader});

  Future<List<VideoModel>> fetchList() async {
    Iterable jsonItems = await assetReader.readJsonFromAsset();
    List<VideoModel> videos = List<VideoModel>.from(
        jsonItems.map((model) => VideoModel.fromJson(model)));
    return videos;
  }
}
