import 'package:flutter_application_1/models/article_models.dart';
import 'package:flutter_application_1/servise/dio_service.dart';
import 'package:get/get.dart';
import '../component/api_component.dart';

class ListArticleControler extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getlist();
  }

  getlist() async {
    loading.value = true;
    var responce = await DioService().getMethod(ApiConstant.getArticleList);
    if (responce.statusCode == 200) {
      responce.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }

  getListArticleWithTagId(String id) async {
    articleList.clear();
    loading.value = true;
    // ignore: prefer_interpolation_to_compose_strings
    var responce = await DioService().getMethod(ApiConstant.baseUrl +
        "/article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=1");
    if (responce.statusCode == 200) {
      responce.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }
}
