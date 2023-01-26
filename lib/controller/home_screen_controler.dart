import 'package:flutter_application_1/component/api_component.dart';
import 'package:flutter_application_1/models/article_models.dart';
import 'package:flutter_application_1/models/podcast_models.dart';
import 'package:flutter_application_1/models/poster_model.dart';
import 'package:flutter_application_1/servise/dio_service.dart';
import 'package:get/get.dart';
import '../models/tags_model.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcasts = RxList();
  RxList<TagsModel> tags = RxList();
  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;
    var responce = await DioService().getMethod(ApiConstant.getHomeItems);
    if (responce.statusCode == 200) {
      responce.data["top_visited"].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });
      responce.data["tags"].forEach((element) {
        tags.add(TagsModel.fromJson(element));
      });
      responce.data["top_podcasts"].forEach((element) {
        topPodcasts.add(PodcastModel.fromJson(element));
      });
      poster.value = PosterModel.fromJson(responce.data["poster"]);
      loading.value = false;
    }
  }
}
