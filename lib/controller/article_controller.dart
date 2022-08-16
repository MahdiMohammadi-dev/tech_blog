import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/api_link.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/services/dio_sevice.dart';

class ArticleController extends GetxController {
  RxList<ArticleModel> articllist = RxList();

  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getarticleitem();
  }

  getarticleitem() async {
    loading.value = true;
    var response =
        await DioService().getMethodFromServer(ApiLink.getarticleitem);

    if (response.statusCode == 200) {
      List<dynamic> rawArticleList = response.data;

      articllist.value = rawArticleList.map((e) {
        return ArticleModel.fromJson(e);
      }).toList();
    }
  }
}
