import 'package:get/get.dart';
import 'package:tech_blog/component/api_link.dart';
import 'package:tech_blog/models/podcast_model.dart';
import 'package:tech_blog/models/poster_model.dart';
import 'package:tech_blog/models/tag_model.dart';
import 'package:tech_blog/services/dio_sevice.dart';
import 'dart:developer';
import '../models/article_model.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;

  RxList tagList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcast = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItem();
  }

  getHomeItem() async {
    loading.value = true;

    var response = await DioService().getMethodFromServer(ApiLink.gethomeitem);

    if (response.statusCode == 200) {

          //////TopVisited

      List<dynamic> rawTopVisited = response.data['top_visited'];
      topVisitedList.value = rawTopVisited.map((e) {
        return ArticleModel.fromJson(e);
      }).toList();

      ////TopPodcast

      List<dynamic> rawTopPodcast = response.data['top_podcasts'];
      topPodcast.value =
          rawTopPodcast.map((e) => PodcastModel.fromJson(e)).toList();


        ////Tags

      List<dynamic> rawTags = response.data['tags'];
      tagList.value =
          rawTags.map((e) => TagModel.fromJson(e)).toList();

        /////Poster

      poster.value = PosterModel.fromJson(response.data['poster']);

      loading.value = false;
    }
  }
}
