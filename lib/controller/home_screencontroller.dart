import 'package:get/get.dart';
import 'package:tech_blog/component/api_link.dart';
import 'package:tech_blog/models/podcast_model.dart';
import 'package:tech_blog/models/poster_model.dart';
import 'package:tech_blog/services/dio_sevice.dart';

import '../models/article_model.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster;

  RxList tagList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcast = RxList();
  @override
  onInit() {
    super.onInit();
    getHomeItem();
  }

  getHomeItem() async {
    var response = await DioService().getMethodFromServer(ApiLink.gethomeitem);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });

      if (response.statusCode == 200) {
        response.data['top_podcasts'].forEach((element) {
          topPodcast.add(PodcastModel.fromJason(element));
        });
      }
    }
  }
}
