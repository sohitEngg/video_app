import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class AssetReader {
  Future<dynamic> readJsonFromAsset() async {
    var jsonText = await rootBundle.loadString('assets/video_list.json');
    return json.decode(jsonText);
  }
}
