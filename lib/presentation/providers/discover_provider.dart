import 'package:flutter/material.dart';
import 'package:tolk_tik/domain/entities/video_post.dart';
import 'package:tolk_tik/infrastructure/models/local_video_model.dart';
import 'package:tolk_tik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO repository, DataSource
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    //todo: cargar videos

    // await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
